import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:oumua/router/app_router.gr.dart';
import 'package:oumua/ui/base/base_view_model.dart';

class WordViewModel extends BaseViewModel {
  late int chapterNum = globalViewModel.words.length;
  late List<String> chapters = globalViewModel.words.keys.toList();

  void init() {
    chapters.sort((a, b) => b.compareTo(a)); // 日期按倒序
  }

  /*
  * 取得某單元的單字數量
  * */
  int? getChapterWordsNum(String chapter) {
    return globalViewModel.words[chapter]?.length;
  }

  /*
  * 跳到單字瀏覽頁面
  * */
  void viewWords(BuildContext context, int chapterIndex) {
    context.router.push(WordListRoute(chapter: chapters[chapterIndex]));
  }
}