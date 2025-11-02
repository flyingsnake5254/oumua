import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oumua/core/models/word.dart';

class WordCard extends StatelessWidget {
  final Word word;
  final Color cardBgColor;

  WordCard(this.word, this.cardBgColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: cardBgColor
      ),
      child: Row(
        children: [
          // 單字資訊
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${word.wordEN} — ${word.wordZH}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Color(0xFF344e41)),),
                Text('[${word.kk}]', style: TextStyle(color: Color(0xFF666666)),),
                Text(''),
                Text("${word.exSentenceEN}"),
                Text("${word.exSentenceZH}")
              ],
            ),
          ),
          Spacer(),
          // 統計資料
          Container(
            child: Column(
              children: [
                Text("評量次數：${word.practiceTimes}", style: TextStyle(color: Color(0xFF3a5a40)),),
                Text("評量正確率：${word.practiceCorrect} %", style: TextStyle(color: Color(0xFF3a5a40)),),
                Text("測驗次數：${word.testTimes}", style: TextStyle(color: Color(0xFF3a5a40)),),
                Text("測驗正確率：${word.testCorrect} %", style: TextStyle(color: Color(0xFF3a5a40)),),
              ],
            ),
          )
        ],
      ),
    );
  }
}