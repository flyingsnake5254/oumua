import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oumua/ui/base/base_view.dart';
import 'package:oumua/ui/word/word_view_model.dart';

@RoutePage()
class WordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        builder: (context, model, child) {
          model.init();
          return Scaffold(
            backgroundColor: model.globalViewModel.backGroundColor,
            body: Container(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(model.chapters[index], textAlign: TextAlign.center,),
                      subtitle: Text('單字數：${model.getChapterWordsNum(model.chapters[index])}', textAlign: TextAlign.center,),
                      onTap: () {
                        model.viewWords(context, index);
                      },
                    );
                  },
                  separatorBuilder: (context, index) => Divider(height: 16,),
                  itemCount: model.chapterNum
              ),
            )
          );
        },
        modelProvider: () => WordViewModel(),
    );
  }
}