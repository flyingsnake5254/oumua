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
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${word.wordEN} — ${word.wordZH}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Color(0xFF344e41)),),
            Text('[${word.kk}]', style: TextStyle(color: Color(0xFF666666)),),
            Text(''),
            Text("${word.exSentenceEN}"),
            Text("${word.exSentenceZH}"),
          ],
        ),
      ),
    );
  }
}