import 'dart:convert';

import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:oumua/core/models/word.dart';

class Util {
  /*
  * 讀取 CSV
  * */
  static Future<List<List<dynamic>>> loadCsv(String filePath) async {
    String raw = await rootBundle.loadString(filePath);

    // 1) 去掉 UTF-8 BOM（有些 Windows/Excel 會有）
    raw = raw.replaceAll('\ufeff', '');

    // 2) 正規化換行：全部轉成 \n
    raw = raw.replaceAll('\r\n', '\n').replaceAll('\r', '\n');

    // 3) 指定分隔符與 eol
    final rows = const CsvToListConverter(
      fieldDelimiter: ';',
      eol: '\n',
      // shouldParseNumbers: false, // 若不想把 "0" 轉數字可開
    ).convert(raw);

    return rows;
  }

  /*
  * 取得目錄下的所有檔案路徑
  * */
  static Future<List<String>> getFileNameListFromDir(String dirPath) async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    final wordFiles = manifestMap.keys
        .where((path) => path.startsWith(dirPath))
        .toList();

    return wordFiles;
  }

  /*
  * (英文單字單元數 , 英文單字總數)
  * */
  static List getTotalWordsNum(Map<String, List<Word>> words) {
    List result = [words.length, 0];
    words.forEach((key, value) {
      result[1] += value.length;
    });
    return result;
  }

  /*
  * 檔名轉日期格式
  * */
  static String fileNameToDateForm(String fileName) {
    DateTime dateTime = DateTime.parse(fileName);
    String result = "${dateTime.year} / ${dateTime.month} / ${dateTime.day}";
    return result;
  }

  static bool isEnglish(String text) {
    final englishRegex = RegExp(r"^[a-zA-Z\s\/\-\.'’]+$");
    return englishRegex.hasMatch(text.trim());
  }

  static bool isChinese(String text) {
    final chineseRegex = RegExp(r'[\u4e00-\u9fff]');
    return chineseRegex.hasMatch(text);
  }
}