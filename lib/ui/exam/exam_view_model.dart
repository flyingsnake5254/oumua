import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oumua/core/models/problem.dart';
import 'package:oumua/core/utils/util.dart';
import 'package:oumua/ui/base/base_view_model.dart';

class ExamViewModel extends BaseViewModel {
  final PageController pageController = PageController();
  final TextEditingController textEditingController = TextEditingController();
  final random = Random();

  List<Problem> problems = [];
  int currentIndex = 0;
  String userAnswer = "";
  int correct = 0;
  String resultImagePath = "";

  List<Color> type3ButtonState = [
    Color(0xffa3b18a),
    Color(0xffa3b18a),
    Color(0xffa3b18a),
    Color(0xffa3b18a),
  ];

  List<Color> type6ButtonState = [
    Color(0x55a3b18a),
    Color(0x55a3b18a),
    Color(0x55a3b18a),
    Color(0x55a3b18a),
  ];

  void init(List<Problem> problems) {
    this.problems = problems;
  }

  void reset() {
    userAnswer = "";
    type3ButtonState = [
      Color(0xffa3b18a),
      Color(0xffa3b18a),
      Color(0xffa3b18a),
      Color(0xffa3b18a),
    ];
    type6ButtonState = [
      Color(0x55a3b18a),
      Color(0x55a3b18a),
      Color(0x55a3b18a),
      Color(0x55a3b18a),
    ];
  }

  void onPageChanged(int value) {
    setBusy(true);
    currentIndex = value;
    reset();
    setBusy(false);
  }

  void next(BuildContext context) {
    textEditingController.text = "";
    pageController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
  }

  /*
  * type 3 function
  * */
  Future<void> type3SelectAnswer(String answer, int which) async {
    this.userAnswer = answer;
    setBusy(true);
    for (int i = 0 ; i < type3ButtonState.length ; i ++) {
      if (i == which) {
        type3ButtonState[i] = Color(0xff588157);
      }
      else {
        type3ButtonState[i] = Color(0xffa3b18a);
      }
    }
    if (Util.isEnglish(answer)) {
      await globalViewModel.speakEN(answer);
    }
    setBusy(false);
  }

  Future<void> type4SpeakQuestion(String question) async {
    await globalViewModel.speakEN(question);
  }

  Future<void> type4SelectAnswer(String answer, int which) async {
    this.userAnswer = answer;
    setBusy(true);
    for (int i = 0 ; i < type3ButtonState.length ; i ++) {
      if (i == which) {
        type3ButtonState[i] = Color(0xff588157);
      }
      else {
        type3ButtonState[i] = Color(0xffa3b18a);
      }
    }
    setBusy(false);
  }

  Future<void> type6SelectAnswer(String answer, int which) async {
    this.userAnswer = answer;
    setBusy(true);
    for (int i = 0 ; i < type3ButtonState.length ; i ++) {
      if (i == which) {
        type6ButtonState[i] = Color(0x88588157);
      }
      else {
        type6ButtonState[i] = Color(0x55a3b18a);
      }
    }
    setBusy(false);
  }

  void setImagePath() {
    double currectAcc = correct / problems.length;
    if (correct == problems.length) {
      resultImagePath = random.nextDouble() > 0.5
          ? 'assets/problems/images/A1.png'
          : 'assets/problems/images/A2.png';
    }
    else if (correct == 0) {
      resultImagePath = 'assets/problems/images/E1.png';
    }
    else if (currectAcc > 0.8) {
      resultImagePath = random.nextDouble() > 0.5
          ? 'assets/problems/images/B1.png'
          : 'assets/problems/images/B2.png';
    }
    else if (currectAcc > 0.6) {
      resultImagePath = random.nextDouble() > 0.5
          ? 'assets/problems/images/C1.png'
          : 'assets/problems/images/C2.png';
    }
    else {
      resultImagePath = random.nextDouble() > 0.5
          ? 'assets/problems/images/D1.png'
          : 'assets/problems/images/D2.png';
    }
  }
}