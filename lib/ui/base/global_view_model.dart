import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:oumua/core/models/problem.dart';
import 'package:oumua/core/models/word.dart';
import 'package:oumua/core/services/log_service.dart';
import 'package:oumua/core/utils/util.dart';

class GlobalViewModel extends ChangeNotifier {
  Map<String, List<Word>> words = {};
  Map<String, List<Problem>> problems = {};
  int totalProblemsNum = 0;
  final FlutterTts tts = FlutterTts();

  void initGlobalViewModel() async {
    initWords();
    initProblems();
    initTts();
  }

  Future<String?> _currentLocale() async {
    try {
      final lang = await tts.getLanguages; // 有些平台支援
      if (lang != null && lang.toString().isNotEmpty) return lang.toString();
    } catch (_) {}
    return null;
  }

  double _suggestRateByPlatformAndLocale(String? locale) {
    final isZh = (locale ?? '').toLowerCase().startsWith('zh');

    if (kIsWeb) {
      // Web: 1.0 ≈ 正常；中文可微降
      return isZh ? 0.9 : 1.0;
    } else {
      // Android/iOS: 0.4~0.6 比較接近正常；中文可再慢一點
      return isZh ? 0.45 : 0.5;
    }
  }

  Future<void> _setNaturalRate() async {
    final loc = await _currentLocale();
    final rate = _suggestRateByPlatformAndLocale(loc);
    await tts.setSpeechRate(rate);
  }

  bool _ttsWarmedUp = false;

  Future<void> ensureTtsReady() async {
    if (_ttsWarmedUp) return;
    try {
      // 很短的暖機（必須在手勢之後呼叫）
      await tts.stop();
      await tts.speak(' ');
      _ttsWarmedUp = true;
    } catch (e) {
      LogService.e('TTS warmup failed: $e');
    }
  }

  Future<void> _setLangAndVoice(String langPriority, List<String> fallbacks) async {
    // 取得 voices
    final voices = await tts.getVoices; // list of maps: { 'name':..., 'locale':... }
    String? pickedLocale;
    Map? pickedVoice;

    bool matchLocale(Map v, String l) {
      final loc = (v['locale'] ?? v['lang'] ?? '').toString();
      return loc.toLowerCase().startsWith(l.toLowerCase());
    }

    // 先找優先語言，再找 fallback
    final candidates = <String>[langPriority, ...fallbacks];
    for (final cand in candidates) {
      pickedVoice = (voices.firstWhere(
            (v) => matchLocale(v, cand),
        orElse: () => null,
      ) as Map?);
      if (pickedVoice != null) {
        pickedLocale = (pickedVoice!['locale'] ?? pickedVoice!['lang']).toString();
        break;
      }
    }

    // 如果完全找不到，就讓瀏覽器自己挑預設，不 setLanguage
    if (pickedLocale != null) {
      await tts.setLanguage(pickedLocale);
      // 可選：若 flutter_tts 支援 setVoice，則綁 voice 名稱
      final name = pickedVoice!['name']?.toString();
      if (name != null) {
        try {
          await tts.setVoice({'name': name, 'locale': pickedLocale});
        } catch (_) {
          // 某些平台 setVoice 可能不支援，忽略
        }
      }
    }
  }

  Future<void> speakEN(String text) async {
    await ensureTtsReady();
    await tts.stop();
    await _setLangAndVoice('en-US', ['en-GB', 'en']);
    await _setNaturalRate();          // 👈 放在語言/voice 設定之後
    await tts.setPitch(1.0);
    await tts.speak(text);
  }

  Future<void> speakZH(String text) async {
    await ensureTtsReady();
    await tts.stop();
    await _setLangAndVoice('zh-TW', ['zh-HK', 'zh-CN', 'zh']);
    await _setNaturalRate();          // 👈 放在語言/voice 設定之後
    await tts.setPitch(1.0);
    await tts.speak(text);
  }



  Future<void> initWords() async {
    List<String> filePathList = await Util.getFileNameListFromDir('assets/words');
    for (String filePath in filePathList) {
      List<List<dynamic>> rows = await Util.loadCsv(filePath);

      String fileName = filePath.replaceAll('.csv', '');
      fileName = fileName.replaceAll('assets/words/', '');
      fileName = Util.fileNameToDateForm(fileName);
      words[fileName] = [];
      for (List row in rows) {
        Word word = new Word(
            row[0],
            row[1],
            row[2],
            row[3],
            row[4],
            row[5],
            row[6],
            row[7],
            row[8]
        );

        words[fileName]?.add(word);
      }
    }
  }

  Future<void> initTts() async {
    await tts.awaitSpeakCompletion(true);
    // await tts.setSpeechRate(1.0);
    await tts.setPitch(1.0);
    await tts.setVolume(1.0);

    // 等待瀏覽器把 voices 載進來（行動版常常一開始是空的）
    List<dynamic> voices = [];
    for (int i = 0; i < 10; i++) {         // 最多等 ~1 秒
      voices = await tts.getVoices;
      if (voices.isNotEmpty) break;
      await Future.delayed(const Duration(milliseconds: 100));
    }

    // 先把可用語言記下來（用於偵錯）
    try {
      final langs = await tts.getLanguages;
      LogService.d({'ttsLanguages': langs});
    } catch (_) {}

    // 不在這裡強設語言，等第一次 speak 時再「動態挑可用的」
  }


  Future<void> initProblems() async {
    List<List<dynamic>> rows = await Util.loadCsv('assets/problems/problems.csv');
    for (var row in rows) {
      if (!problems.containsKey(row[1])) {
        problems[row[1]] = [];
      }
      Problem problem = new Problem(
          row[0],
          row[1],
          row[2],
          row[3],
          [row[4], row[5], row[6], row[7]],
          row[8]
      );
      problems[row[1]]?.add(problem);
    }
    problems.forEach((key, value) {
      totalProblemsNum += value.length;
    },);
    // LogService.d(problems);
  }

  /*
  * 顏色參數
  * */
  Color backGroundColor = Color(0xffdad7cd);
  Color wordCardBGColor = Color(0x44a3b18a);


}
