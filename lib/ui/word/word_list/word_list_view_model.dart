import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:oumua/core/models/problem.dart';
import 'package:oumua/core/models/word.dart';
import 'package:oumua/router/app_router.gr.dart';
import 'package:oumua/ui/base/base_view_model.dart';

class WordListViewModel extends BaseViewModel {
  String chapter = "";
  List<Word> wordList = [];
  List<String> wordEN = [];

  void init(String chapter) {
    this.chapter = chapter;
    wordList = globalViewModel.words[chapter]!.cast<Word>();
    for (Word word in wordList) {
      wordEN.add(word.wordEN);
    }
  }

  void speakCard(int index) async{
    Word word = wordList[index];
    await globalViewModel.speakEN(word.wordEN);
    await globalViewModel.speakZH(word.wordZH);
    await globalViewModel.speakEN(word.exSentenceEN);
    await globalViewModel.speakZH(word.exSentenceZH);
  }

  void exam(BuildContext context) {
    List<Problem> problems = [];
    globalViewModel.problems.forEach((key, value) {
      if (wordEN.contains(key)) {
        problems.addAll(value);
      }
    },);
    problems.shuffle();
    if (problems.length != 0) {
      for (int i = 0 ; i < problems.length ; i ++) {
        problems[i].options.shuffle();
      }
      context.router.push(ExamRoute(problems: problems));
    }
  }
}