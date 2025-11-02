import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:oumua/core/models/word.dart';
import 'package:oumua/core/services/log_service.dart';
import 'package:oumua/core/utils/util.dart';

class GlobalViewModel extends ChangeNotifier {
  Map<String, List<Word>> words = {};
  final FlutterTts tts = FlutterTts();

  void initGlobalViewModel() async {
    initWords();
    initTts();
  }

  Future<void> speakEN(String text) async {
    LogService.d("開始說：${text}");
    await tts.stop();
    await tts.setLanguage("en-US");
    await tts.setPitch(1.0);
    await tts.speak(text);
    LogService.d("說完了：${text}");
  }

  Future<void> speakZH(String text) async {
    LogService.i("開始說：${text}");
    await tts.stop();
    await tts.setLanguage("zh-TW");
    await tts.setPitch(1.0);
    await tts.speak(text);
    LogService.i("說完了：${text}");
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
    LogService.i(words);
  }

  Future<void> initTts() async {
    // 說完再回傳（Android/iOS/Web 都支援）
    await tts.awaitSpeakCompletion(true);

    // 建議加一些預設
    await tts.setSpeechRate(1);
    await tts.setPitch(1.0);
    await tts.setVolume(1.0);
  }

  /*
  * 顏色參數
  * */
  Color backGroundColor = Color(0xffdad7cd);
  Color wordCardBGColor = Color(0x44a3b18a);
}
