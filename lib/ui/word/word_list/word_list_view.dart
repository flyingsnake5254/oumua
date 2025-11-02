import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oumua/ui/base/base_view.dart';
import 'package:oumua/ui/word/word_list/widgets/word_card.dart';
import 'package:oumua/ui/word/word_list/word_list_view_model.dart';

@RoutePage()
class WordListView extends StatelessWidget {
  final String chapter;
  const WordListView({super.key, required this.chapter});


  @override
  Widget build(BuildContext context) {
    return BaseView(
        builder: (context, model, child) {
          model.init(chapter);
          return Scaffold(
            backgroundColor: model.globalViewModel.backGroundColor,
            appBar: AppBar(title: Text(chapter),),
            body: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: WordCard(model.wordList[index], model.globalViewModel.wordCardBGColor),
                    onTap: () {
                      model.speakCard(index);
                    },
                  );
                },
                separatorBuilder: (context, index) => Divider(height: 16,),
                itemCount: model.wordList.length
            ),
            bottomNavigationBar: SafeArea(
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: FloatingActionButton.extended(
                            icon: Icon(
                              Icons.add, // 設置 Icon
                              color: Colors.white, // 設置 Icon 顏色
                              // size: 20,
                            ),
                            label: Text('顯示文字', style: TextStyle(fontSize: null, fontWeight: null, color: Colors.white),),
                            backgroundColor: Colors.blueGrey, // 按鈕背景顏色
                            onPressed: () {
                              // 點擊事件
                            },
                          ),
                        )
                    ),
                  ],
                )
            ),
          );
        },
        modelProvider: () => WordListViewModel(),
    );
  }
}