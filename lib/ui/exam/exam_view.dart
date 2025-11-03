import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oumua/core/models/problem.dart';
import 'package:oumua/router/app_router.gr.dart';
import 'package:oumua/ui/base/base_view.dart';
import 'package:oumua/ui/exam/exam_view_model.dart';


@RoutePage()
class ExamView extends StatelessWidget {
  final List<Problem> problems;

  const ExamView({super.key, required this.problems});

  @override
  Widget build(BuildContext context) {
    return BaseView(
        builder: (context, model, child) {
          model.init(problems);
          return Scaffold(
            backgroundColor: model.globalViewModel.backGroundColor,
            appBar: AppBar(
              title: Text("${model.currentIndex + 1} / ${model.problems.length}"),
              centerTitle: true,
            ),
            body: GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: Column(
                children: [
                  Expanded(
                      child: PageView.builder(
                          controller: model.pageController,
                          itemCount: model.problems.length,
                          physics: const NeverScrollableScrollPhysics(),
                          onPageChanged: (value) {
                            model.onPageChanged(value);
                          },
                          itemBuilder: (context, index) {
                            Problem problem = model.problems[model.currentIndex];
                            // LogService.i(problem);
                            if (problem.type == 1) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsGeometry.all(30),
                                    child: FittedBox(child: Text('${problem.question}', style: TextStyle(fontSize: 50, color: Color(0xff588157)),),),
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Spacer(),
                                      Container(
                                        // 按鈕寬度、高度
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        height: MediaQuery.of(context).size.height * 0.15,
                                        child: ElevatedButton(
                                          child: FittedBox(child: Text('${problem.options[0]}', style: TextStyle(fontSize: 50, fontWeight: FontWeight.w800, color: null),),),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: model.type3ButtonState[0], // 按鈕背景顏色
                                            foregroundColor: Colors.white, // 按鈕文字顏色
                                            shadowColor: Colors.grey, // 按鈕陰影顏色
                                            elevation: 10, // 按鈕陰影大小

                                            // 貝塞爾曲線形狀按鈕
                                            shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(40),),
                                          ),
                                          onPressed: () {
                                            // 點擊按鈕事件
                                            model.type3SelectAnswer(problem.options[0], 0);
                                          },
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        // 按鈕寬度、高度
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        height: MediaQuery.of(context).size.height * 0.15,
                                        child: ElevatedButton(
                                          child: FittedBox(child: Text('${problem.options[1]}', style: TextStyle(fontSize: 50, fontWeight: FontWeight.w800, color: null),),),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: model.type3ButtonState[1], // 按鈕背景顏色
                                            foregroundColor: Colors.white, // 按鈕文字顏色
                                            shadowColor: Colors.grey, // 按鈕陰影顏色
                                            elevation: 10, // 按鈕陰影大小

                                            // 貝塞爾曲線形狀按鈕
                                            shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(40),),
                                          ),
                                          onPressed: () {
                                            // 點擊按鈕事件
                                            model.type3SelectAnswer(problem.options[1], 1);
                                          },
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Spacer(),
                                      Container(
                                        // 按鈕寬度、高度
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        height: MediaQuery.of(context).size.height * 0.15,
                                        child: ElevatedButton(
                                          child: FittedBox(child: Text('${problem.options[2]}', style: TextStyle(fontSize: 50, fontWeight: FontWeight.w800, color: null),),),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: model.type3ButtonState[2], // 按鈕背景顏色
                                            foregroundColor: Colors.white, // 按鈕文字顏色
                                            shadowColor: Colors.grey, // 按鈕陰影顏色
                                            elevation: 10, // 按鈕陰影大小

                                            // 貝塞爾曲線形狀按鈕
                                            shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(40),),
                                          ),
                                          onPressed: () {
                                            // 點擊按鈕事件
                                            model.type3SelectAnswer(problem.options[2], 2);
                                          },
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        // 按鈕寬度、高度
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        height: MediaQuery.of(context).size.height * 0.15,
                                        child: ElevatedButton(
                                          child: FittedBox(child: Text('${problem.options[3]}', style: TextStyle(fontSize: 50, fontWeight: FontWeight.w800, color: null),),),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: model.type3ButtonState[3], // 按鈕背景顏色
                                            foregroundColor: Colors.white, // 按鈕文字顏色
                                            shadowColor: Colors.grey, // 按鈕陰影顏色
                                            elevation: 10, // 按鈕陰影大小

                                            // 貝塞爾曲線形狀按鈕
                                            shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(40),),
                                          ),
                                          onPressed: () {
                                            // 點擊按鈕事件
                                            model.type3SelectAnswer(problem.options[3], 3);
                                          },
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                  Spacer(),
                                ],
                              );
                            }
                            else if (problem.type == 2) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsGeometry.all(30),
                                    child: FittedBox(child: Text('${problem.question}', style: TextStyle(fontSize: 50, color: Color(0xff588157)),),),
                                  ),
                                  Container(
                                    color: Color(0xffdad7cd),
                                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Material(
                                        child: TextField(
                                          onChanged: (value) {
                                            model.userAnswer = value;
                                          },
                                          // 綁定 viewmodel 的 controller
                                          controller: model.textEditingController,
                                          // 輸入文字的樣式
                                          style: const TextStyle(fontSize: null, fontWeight: null, color: null),
                                          decoration: InputDecoration(
                                            // 輸入框周圍的文字、樣式
                                            hintText: '快輸入答案^^', hintStyle: TextStyle(fontSize: null, fontWeight: null, color: Color(0xffa3b18a)), // 輸入框的提示文字，在輸入文字後，會消失

                                            // 輸入框裡前綴 icon
                                            prefixIcon: Padding(
                                              padding: EdgeInsetsGeometry.all(5),
                                              child: Image.asset('assets/problems/images/oumua2.png', fit: BoxFit.contain, height: 30,),
                                            ),

                                            // 預設邊框樣式
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(15), // 邊框圓滑程度
                                            ),
                                            // 焦點時的邊框樣式
                                            focusedBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xff3a5a40), // 邊框顏色
                                                    width: 1 // 邊框粗細
                                                )
                                            ),
                                            // 啟用但未焦點時的邊框樣式
                                            enabledBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xffa3b18a), // 邊框顏色
                                                    width: 1 // 邊框粗細
                                                )
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            }
                            else if (problem.type == 3) {
                              // T3：圖片檔名、四個選項、答案
                              return Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsGeometry.all(30),
                                    child: Image.asset(
                                      problem.question,
                                      height: MediaQuery.of(context).size.height * 0.3,
                                    ),
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Spacer(),
                                      Container(
                                        // 按鈕寬度、高度
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        height: MediaQuery.of(context).size.height * 0.15,
                                        child: ElevatedButton(
                                          child: FittedBox(child: Text('${problem.options[0]}', style: TextStyle(fontSize: 50, fontWeight: FontWeight.w800, color: null),),),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: model.type3ButtonState[0], // 按鈕背景顏色
                                            foregroundColor: Colors.white, // 按鈕文字顏色
                                            shadowColor: Colors.grey, // 按鈕陰影顏色
                                            elevation: 10, // 按鈕陰影大小

                                            // 貝塞爾曲線形狀按鈕
                                            shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(40),),
                                          ),
                                          onPressed: () {
                                            // 點擊按鈕事件
                                            model.type3SelectAnswer(problem.options[0], 0);
                                          },
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        // 按鈕寬度、高度
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        height: MediaQuery.of(context).size.height * 0.15,
                                        child: ElevatedButton(
                                          child: FittedBox(child: Text('${problem.options[1]}', style: TextStyle(fontSize: 50, fontWeight: FontWeight.w800, color: null),),),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: model.type3ButtonState[1], // 按鈕背景顏色
                                            foregroundColor: Colors.white, // 按鈕文字顏色
                                            shadowColor: Colors.grey, // 按鈕陰影顏色
                                            elevation: 10, // 按鈕陰影大小

                                            // 貝塞爾曲線形狀按鈕
                                            shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(40),),
                                          ),
                                          onPressed: () {
                                            // 點擊按鈕事件
                                            model.type3SelectAnswer(problem.options[1], 1);
                                          },
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Spacer(),
                                      Container(
                                        // 按鈕寬度、高度
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        height: MediaQuery.of(context).size.height * 0.15,
                                        child: ElevatedButton(
                                          child: FittedBox(child: Text('${problem.options[2]}', style: TextStyle(fontSize: 50, fontWeight: FontWeight.w800, color: null),),),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: model.type3ButtonState[2], // 按鈕背景顏色
                                            foregroundColor: Colors.white, // 按鈕文字顏色
                                            shadowColor: Colors.grey, // 按鈕陰影顏色
                                            elevation: 10, // 按鈕陰影大小

                                            // 貝塞爾曲線形狀按鈕
                                            shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(40),),
                                          ),
                                          onPressed: () {
                                            // 點擊按鈕事件
                                            model.type3SelectAnswer(problem.options[2], 2);
                                          },
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        // 按鈕寬度、高度
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        height: MediaQuery.of(context).size.height * 0.15,
                                        child: ElevatedButton(
                                          child: FittedBox(child: Text('${problem.options[3]}', style: TextStyle(fontSize: 50, fontWeight: FontWeight.w800, color: null),),),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: model.type3ButtonState[3], // 按鈕背景顏色
                                            foregroundColor: Colors.white, // 按鈕文字顏色
                                            shadowColor: Colors.grey, // 按鈕陰影顏色
                                            elevation: 10, // 按鈕陰影大小

                                            // 貝塞爾曲線形狀按鈕
                                            shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(40),),
                                          ),
                                          onPressed: () {
                                            // 點擊按鈕事件
                                            model.type3SelectAnswer(problem.options[3], 3);
                                          },
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                  Spacer(),
                                ],
                              );
                            }
                            else if (problem.type == 4) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsGeometry.all(30),
                                    child: FittedBox(child: Text('根據聽到的內容選擇答案', style: TextStyle(fontSize: 50, color: Color(0xff588157)),),),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: FloatingActionButton.extended(
                                      icon: Icon(
                                        Icons.volume_down_outlined, // 設置 Icon
                                        color: Colors.white, // 設置 Icon 顏色
                                        // size: 20,
                                      ),
                                      label: Text('點我播放', style: TextStyle(fontSize: 20, fontWeight: null, color: Colors.white),),
                                      backgroundColor: Colors.blueGrey, // 按鈕背景顏色
                                      onPressed: () {
                                        // 點擊事件
                                        model.type4SpeakQuestion(problem.question);
                                      },
                                    ),
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Spacer(),
                                      Container(
                                        // 按鈕寬度、高度
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        height: MediaQuery.of(context).size.height * 0.15,
                                        child: ElevatedButton(
                                          child: FittedBox(child: Text('${problem.options[0]}', style: TextStyle(fontSize: 50, fontWeight: FontWeight.w800, color: null),),),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: model.type3ButtonState[0], // 按鈕背景顏色
                                            foregroundColor: Colors.white, // 按鈕文字顏色
                                            shadowColor: Colors.grey, // 按鈕陰影顏色
                                            elevation: 10, // 按鈕陰影大小

                                            // 貝塞爾曲線形狀按鈕
                                            shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(40),),
                                          ),
                                          onPressed: () {
                                            // 點擊按鈕事件
                                            model.type4SelectAnswer(problem.options[0], 0);
                                          },
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        // 按鈕寬度、高度
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        height: MediaQuery.of(context).size.height * 0.15,
                                        child: ElevatedButton(
                                          child: FittedBox(child: Text('${problem.options[1]}', style: TextStyle(fontSize: 50, fontWeight: FontWeight.w800, color: null),),),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: model.type3ButtonState[1], // 按鈕背景顏色
                                            foregroundColor: Colors.white, // 按鈕文字顏色
                                            shadowColor: Colors.grey, // 按鈕陰影顏色
                                            elevation: 10, // 按鈕陰影大小

                                            // 貝塞爾曲線形狀按鈕
                                            shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(40),),
                                          ),
                                          onPressed: () {
                                            // 點擊按鈕事件
                                            model.type4SelectAnswer(problem.options[1], 1);
                                          },
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Spacer(),
                                      Container(
                                        // 按鈕寬度、高度
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        height: MediaQuery.of(context).size.height * 0.15,
                                        child: ElevatedButton(
                                          child: FittedBox(child: Text('${problem.options[2]}', style: TextStyle(fontSize: 50, fontWeight: FontWeight.w800, color: null),),),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: model.type3ButtonState[2], // 按鈕背景顏色
                                            foregroundColor: Colors.white, // 按鈕文字顏色
                                            shadowColor: Colors.grey, // 按鈕陰影顏色
                                            elevation: 10, // 按鈕陰影大小

                                            // 貝塞爾曲線形狀按鈕
                                            shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(40),),
                                          ),
                                          onPressed: () {
                                            // 點擊按鈕事件
                                            model.type4SelectAnswer(problem.options[2], 2);
                                          },
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        // 按鈕寬度、高度
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        height: MediaQuery.of(context).size.height * 0.15,
                                        child: ElevatedButton(
                                          child: FittedBox(child: Text('${problem.options[3]}', style: TextStyle(fontSize: 50, fontWeight: FontWeight.w800, color: null),),),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: model.type3ButtonState[3], // 按鈕背景顏色
                                            foregroundColor: Colors.white, // 按鈕文字顏色
                                            shadowColor: Colors.grey, // 按鈕陰影顏色
                                            elevation: 10, // 按鈕陰影大小

                                            // 貝塞爾曲線形狀按鈕
                                            shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(40),),
                                          ),
                                          onPressed: () {
                                            // 點擊按鈕事件
                                            model.type4SelectAnswer(problem.options[3], 3);
                                          },
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                  Spacer(),
                                ],
                              );
                            }
                            else if (problem.type == 5) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsGeometry.all(30),
                                    child: FittedBox(child: Text('根據聽到的內容回答以下問題', style: TextStyle(fontSize: 35, color: Color(0xff588157)),),),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: FloatingActionButton.extended(
                                      icon: Icon(
                                        Icons.volume_down_outlined, // 設置 Icon
                                        color: Colors.white, // 設置 Icon 顏色
                                        // size: 20,
                                      ),
                                      label: Text('點我播放', style: TextStyle(fontSize: 20, fontWeight: null, color: Colors.white),),
                                      backgroundColor: Colors.blueGrey, // 按鈕背景顏色
                                      onPressed: () {
                                        // 點擊事件
                                        model.type4SpeakQuestion(problem.question);
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsGeometry.all(30),
                                    child: FittedBox(child: Text('${problem.question2}', style: TextStyle(fontSize: 25, color: Color(0xff588157)),),),
                                  ),
                                  Container(
                                    color: Color(0xffdad7cd),
                                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Material(
                                        child: TextField(
                                          onChanged: (value) {
                                            model.userAnswer = value;
                                          },
                                          // 綁定 viewmodel 的 controller
                                          controller: model.textEditingController,
                                          // 輸入文字的樣式
                                          style: const TextStyle(fontSize: null, fontWeight: null, color: null),
                                          decoration: InputDecoration(
                                            // 輸入框周圍的文字、樣式
                                            hintText: '快輸入答案^^', hintStyle: TextStyle(fontSize: null, fontWeight: null, color: Color(0xffa3b18a)), // 輸入框的提示文字，在輸入文字後，會消失

                                            // 輸入框裡前綴 icon
                                            prefixIcon: Padding(
                                              padding: EdgeInsetsGeometry.all(5),
                                              child: Image.asset('assets/problems/images/oumua2.png', fit: BoxFit.contain, height: 30,),
                                            ),

                                            // 預設邊框樣式
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(15), // 邊框圓滑程度
                                            ),
                                            // 焦點時的邊框樣式
                                            focusedBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xff3a5a40), // 邊框顏色
                                                    width: 1 // 邊框粗細
                                                )
                                            ),
                                            // 啟用但未焦點時的邊框樣式
                                            enabledBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xffa3b18a), // 邊框顏色
                                                    width: 1 // 邊框粗細
                                                )
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            }
                            else if (problem.type == 6) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsGeometry.all(30),
                                    child: FittedBox(child: Text('根據聽到的內容回答問題', style: TextStyle(fontSize: 35, color: Color(0xff588157)),),),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: FloatingActionButton.extended(
                                      icon: Icon(
                                        Icons.volume_down_outlined, // 設置 Icon
                                        color: Colors.white, // 設置 Icon 顏色
                                        // size: 20,
                                      ),
                                      label: Text('點我播放', style: TextStyle(fontSize: 20, fontWeight: null, color: Colors.white),),
                                      backgroundColor: Colors.blueGrey, // 按鈕背景顏色
                                      onPressed: () {
                                        // 點擊事件
                                        model.type4SpeakQuestion(problem.question);
                                      },
                                    ),
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Spacer(),
                                      Container(
                                        // 按鈕寬度、高度
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        height: MediaQuery.of(context).size.height * 0.2,
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          child: IconButton.filled(
                                            icon: Image.asset(problem.options[0]), // 設置 Icon
                                            style: IconButton.styleFrom(
                                              backgroundColor: model.type6ButtonState[0],
                                              // 圓角矩形按鈕, 設定圓角的半徑為20
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                                            ),
                                            onPressed: () {
                                              // 點擊按鈕事件
                                              model.type6SelectAnswer(problem.options[0], 0);
                                            },
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        // 按鈕寬度、高度
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        height: MediaQuery.of(context).size.height * 0.2,
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          child: IconButton.filled(
                                            icon: Image.asset(problem.options[1]), // 設置 Icon
                                            style: IconButton.styleFrom(
                                              backgroundColor: model.type6ButtonState[1],
                                              // 圓角矩形按鈕, 設定圓角的半徑為20
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                                            ),
                                            onPressed: () {
                                              // 點擊按鈕事件
                                              model.type6SelectAnswer(problem.options[1], 1);
                                            },
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Spacer(),
                                      Container(
                                        // 按鈕寬度、高度
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        height: MediaQuery.of(context).size.height * 0.2,
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          child: IconButton.filled(
                                            icon: Image.asset(problem.options[2]), // 設置 Icon
                                            style: IconButton.styleFrom(
                                              backgroundColor: model.type6ButtonState[2],
                                              // 圓角矩形按鈕, 設定圓角的半徑為20
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                                            ),
                                            onPressed: () {
                                              // 點擊按鈕事件
                                              model.type6SelectAnswer(problem.options[2], 2);
                                            },
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        // 按鈕寬度、高度
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        height: MediaQuery.of(context).size.height * 0.2,
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          child: IconButton.filled(
                                            icon: Image.asset(problem.options[3]), // 設置 Icon
                                            style: IconButton.styleFrom(
                                              backgroundColor: model.type6ButtonState[3],
                                              // 圓角矩形按鈕, 設定圓角的半徑為20
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                                            ),
                                            onPressed: () {
                                              // 點擊按鈕事件
                                              model.type6SelectAnswer(problem.options[3], 3);
                                            },
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                  Spacer(),
                                ],
                              );
                            }
                            else if (problem.type == 7) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsGeometry.all(30),
                                    child: FittedBox(child: Text('根據聽到的內容回答問題', style: TextStyle(fontSize: 35, color: Color(0xff588157)),),),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: FloatingActionButton.extended(
                                      icon: Icon(
                                        Icons.volume_down_outlined, // 設置 Icon
                                        color: Colors.white, // 設置 Icon 顏色
                                        // size: 20,
                                      ),
                                      label: Text('點我播放', style: TextStyle(fontSize: 20, fontWeight: null, color: Colors.white),),
                                      backgroundColor: Colors.blueGrey, // 按鈕背景顏色
                                      onPressed: () {
                                        // 點擊事件
                                        model.type4SpeakQuestion(problem.question);
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsGeometry.all(30),
                                    child: FittedBox(child: Text('${problem.question2}', style: TextStyle(fontSize: 30, color: Color(0xff588157)),),),
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Spacer(),
                                      Container(
                                        // 按鈕寬度、高度
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        height: MediaQuery.of(context).size.height * 0.15,
                                        child: ElevatedButton(
                                          child: FittedBox(child: Text('${problem.options[0]}', style: TextStyle(fontSize: 50, fontWeight: FontWeight.w800, color: null),),),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: model.type3ButtonState[0], // 按鈕背景顏色
                                            foregroundColor: Colors.white, // 按鈕文字顏色
                                            shadowColor: Colors.grey, // 按鈕陰影顏色
                                            elevation: 10, // 按鈕陰影大小

                                            // 貝塞爾曲線形狀按鈕
                                            shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(40),),
                                          ),
                                          onPressed: () {
                                            // 點擊按鈕事件
                                            model.type3SelectAnswer(problem.options[0], 0);
                                          },
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        // 按鈕寬度、高度
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        height: MediaQuery.of(context).size.height * 0.15,
                                        child: ElevatedButton(
                                          child: FittedBox(child: Text('${problem.options[1]}', style: TextStyle(fontSize: 50, fontWeight: FontWeight.w800, color: null),),),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: model.type3ButtonState[1], // 按鈕背景顏色
                                            foregroundColor: Colors.white, // 按鈕文字顏色
                                            shadowColor: Colors.grey, // 按鈕陰影顏色
                                            elevation: 10, // 按鈕陰影大小

                                            // 貝塞爾曲線形狀按鈕
                                            shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(40),),
                                          ),
                                          onPressed: () {
                                            // 點擊按鈕事件
                                            model.type3SelectAnswer(problem.options[1], 1);
                                          },
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Spacer(),
                                      Container(
                                        // 按鈕寬度、高度
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        height: MediaQuery.of(context).size.height * 0.15,
                                        child: ElevatedButton(
                                          child: FittedBox(child: Text('${problem.options[2]}', style: TextStyle(fontSize: 50, fontWeight: FontWeight.w800, color: null),),),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: model.type3ButtonState[2], // 按鈕背景顏色
                                            foregroundColor: Colors.white, // 按鈕文字顏色
                                            shadowColor: Colors.grey, // 按鈕陰影顏色
                                            elevation: 10, // 按鈕陰影大小

                                            // 貝塞爾曲線形狀按鈕
                                            shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(40),),
                                          ),
                                          onPressed: () {
                                            // 點擊按鈕事件
                                            model.type3SelectAnswer(problem.options[2], 2);
                                          },
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        // 按鈕寬度、高度
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        height: MediaQuery.of(context).size.height * 0.15,
                                        child: ElevatedButton(
                                          child: FittedBox(child: Text('${problem.options[3]}', style: TextStyle(fontSize: 50, fontWeight: FontWeight.w800, color: null),),),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: model.type3ButtonState[3], // 按鈕背景顏色
                                            foregroundColor: Colors.white, // 按鈕文字顏色
                                            shadowColor: Colors.grey, // 按鈕陰影顏色
                                            elevation: 10, // 按鈕陰影大小

                                            // 貝塞爾曲線形狀按鈕
                                            shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(40),),
                                          ),
                                          onPressed: () {
                                            // 點擊按鈕事件
                                            model.type3SelectAnswer(problem.options[3], 3);
                                          },
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                  Spacer(),
                                ],
                              );
                            }

                          },
                      )
                  ),
                  Row(
                    children: [
                      Expanded(child: Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton.extended(
                          icon: Icon(
                            Icons.search, // 設置 Icon
                            color: Color(0xffdad7cd), // 設置 Icon 顏色
                            // size: 20,
                          ),
                          label: Text('檢查', style: TextStyle(fontSize: 20, fontWeight: null, color: Color(0xffdad7cd)),),
                          backgroundColor: Color(0xff3a5a40), // 按鈕背景顏色
                          onPressed: () {
                            Problem problem = model.problems[model.currentIndex];

                            if (problem.type == 6) {
                              if (model.userAnswer == problem.answer) {
                                model.correct += 1;
                                showModalBottomSheet(
                                  isDismissible: false,
                                  enableDrag: false,
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                                  ),
                                  backgroundColor: Color(0xffdad7cd),
                                  builder: (_) {
                                    return Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Image.asset('assets/problems/images/oumua3.png', height: MediaQuery.of(context).size.height * 0.2,),
                                                Text("十分天才", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Color(0xff3a5a40))),
                                                FittedBox(child: Text("聽力內容：${problem.question}", style: TextStyle(fontSize: 20, color: Colors.black),),),
                                                FittedBox(child: Text("正確答案：", style: TextStyle(fontSize: 20, color: Color(0xff3a5a40)),),),
                                                Image.asset('${problem.answer}', height: MediaQuery.of(context).size.height * 0.1,),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                            model.next(context);
                                                            if (model.currentIndex == problems.length - 1) {
                                                              model.setImagePath();
                                                              showModalBottomSheet(
                                                                isDismissible: false,
                                                                enableDrag: false,
                                                                context: context,
                                                                shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                                                                ),
                                                                backgroundColor: Color(0xffdad7cd),
                                                                builder: (_) {
                                                                  return Padding(
                                                                    padding: EdgeInsetsGeometry.all(15),
                                                                    child: Row(
                                                                      children: [
                                                                        Expanded(
                                                                            child: Column(
                                                                              children: [
                                                                                FittedBox(child: Text('答題結束！', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800, color: Color(0xff3a5a40)),),),
                                                                                SizedBox(height: 20,),
                                                                                FittedBox(child: Text('正確率', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Color(0xff3a5a40)),),),
                                                                                SizedBox(height: 10,),
                                                                                FittedBox(child: Text('${((model.correct / problems.length) * 100).round()} %', style: TextStyle(fontSize: 70, fontWeight: FontWeight.w800, color: Color(0xff415a77)),),),
                                                                                Expanded(child: Image.asset(model.resultImagePath, )),
                                                                                Row(
                                                                                  children: [
                                                                                    Expanded(child: Container(
                                                                                      // 按鈕寬度、高度
                                                                                      // width: 200,
                                                                                      // height: 80,
                                                                                      child: ElevatedButton(
                                                                                        child: Text('有人要當 V 了🥺', style: TextStyle(fontSize: null, fontWeight: null, color: null),),
                                                                                        style: ElevatedButton.styleFrom(
                                                                                          backgroundColor: Color(0xffa3b18a), // 按鈕背景顏色
                                                                                          foregroundColor: Colors.white, // 按鈕文字顏色
                                                                                          shadowColor: Colors.grey, // 按鈕陰影顏色
                                                                                          elevation: 10, // 按鈕陰影大小
                                                                                          shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(28),),
                                                                                        ),
                                                                                        onPressed: () {
                                                                                          // 點擊按鈕事件
                                                                                          if (problems.length == model.globalViewModel.totalProblemsNum) {
                                                                                            context.router.replace(ChallengeRoute());
                                                                                          }
                                                                                          else {
                                                                                            context.router.popUntil((route) => route.settings.name == WordListRoute.name);
                                                                                          }
                                                                                        },
                                                                                      ),
                                                                                    ))
                                                                                  ],
                                                                                )
                                                                              ],
                                                                            )
                                                                        )
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            }
                                                          },
                                                          child: Text("繼續", style: TextStyle(color: Color(0xff3a5a40)),),
                                                        )
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),)
                                          ],
                                        )
                                    );
                                  },
                                );
                              }
                              else {
                                showModalBottomSheet(
                                  isDismissible: false,
                                  enableDrag: false,
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                                  ),
                                  backgroundColor: Color(0xffdad7cd),
                                  builder: (_) {
                                    return Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Row(
                                          children: [
                                            Expanded(child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Image.asset('assets/problems/images/oumua4.png', height: MediaQuery.of(context).size.height * 0.2,),
                                                FittedBox(child: Text("瘋狂倒讚 👎👎", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.red)),),
                                                FittedBox(child: Text("聽力內容：${problem.question}", style: TextStyle(fontSize: 20, color: Colors.black),),),
                                                FittedBox(child: Text("正確答案：", style: TextStyle(fontSize: 20, color: Color(0xff3a5a40), fontWeight: FontWeight.bold),),),
                                                Image.asset('${problem.answer}', height: MediaQuery.of(context).size.height * 0.1,),
                                                // SizedBox(height: 20),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                            model.next(context);
                                                            if (model.currentIndex == problems.length - 1) {
                                                              model.setImagePath();
                                                              showModalBottomSheet(
                                                                isDismissible: false,
                                                                enableDrag: false,
                                                                context: context,
                                                                shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                                                                ),
                                                                backgroundColor: Color(0xffdad7cd),
                                                                builder: (_) {
                                                                  return Padding(
                                                                    padding: EdgeInsetsGeometry.all(15),
                                                                    child: Row(
                                                                      children: [
                                                                        Expanded(
                                                                            child: Column(
                                                                              children: [
                                                                                FittedBox(child: Text('答題結束！', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800, color: Color(0xff3a5a40)),),),
                                                                                SizedBox(height: 20,),
                                                                                FittedBox(child: Text('正確率', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Color(0xff3a5a40)),),),
                                                                                SizedBox(height: 10,),
                                                                                FittedBox(child: Text('${((model.correct / problems.length) * 100).round()} %', style: TextStyle(fontSize: 70, fontWeight: FontWeight.w800, color: Color(0xff415a77)),),),
                                                                                Expanded(child: Image.asset(model.resultImagePath, )),
                                                                                Row(
                                                                                  children: [
                                                                                    Expanded(child: Container(
                                                                                      // 按鈕寬度、高度
                                                                                      // width: 200,
                                                                                      // height: 80,
                                                                                      child: ElevatedButton(
                                                                                        child: Text('有人要當 V 了🥺', style: TextStyle(fontSize: null, fontWeight: null, color: null),),
                                                                                        style: ElevatedButton.styleFrom(
                                                                                          backgroundColor: Color(0xffa3b18a), // 按鈕背景顏色
                                                                                          foregroundColor: Colors.white, // 按鈕文字顏色
                                                                                          shadowColor: Colors.grey, // 按鈕陰影顏色
                                                                                          elevation: 10, // 按鈕陰影大小
                                                                                          shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(28),),
                                                                                        ),
                                                                                        onPressed: () {
                                                                                          // 點擊按鈕事件
                                                                                          if (problems.length == model.globalViewModel.totalProblemsNum) {
                                                                                            context.router.replace(ChallengeRoute());
                                                                                          }
                                                                                          else {
                                                                                            context.router.popUntil((route) => route.settings.name == WordListRoute.name);
                                                                                          }
                                                                                        },
                                                                                      ),
                                                                                    ))
                                                                                  ],
                                                                                )
                                                                              ],
                                                                            )
                                                                        )
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            }
                                                          },
                                                          child: Text("繼續", style: TextStyle(color: Color(0xff3a5a40)),),
                                                        )
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),)
                                          ],
                                        )
                                    );
                                  },
                                );

                              }
                            }
                            else if (problem.type == 4 || problem.type == 5 || problem.type == 7) {
                              if (model.userAnswer == problem.answer) {
                                model.correct += 1;
                                showModalBottomSheet(
                                  isDismissible: false,
                                  enableDrag: false,
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                                  ),
                                  backgroundColor: Color(0xffdad7cd),
                                  builder: (_) {
                                    return Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Row(
                                          children: [
                                            Expanded(child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Image.asset('assets/problems/images/oumua3.png', height: MediaQuery.of(context).size.height * 0.2,),
                                                Text("十分天才", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Color(0xff3a5a40))),
                                                FittedBox(child: Text("聽力內容：${problem.question}", style: TextStyle(fontSize: 20, color: Colors.black),),),
                                                FittedBox(child: Text("正確答案：${problem.answer}", style: TextStyle(fontSize: 20, color: Color(0xff3a5a40)),),),
                                                // SizedBox(height: 20),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                            model.next(context);
                                                            if (model.currentIndex == problems.length - 1) {
                                                              model.setImagePath();
                                                              showModalBottomSheet(
                                                                isDismissible: false,
                                                                enableDrag: false,
                                                                context: context,
                                                                shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                                                                ),
                                                                backgroundColor: Color(0xffdad7cd),
                                                                builder: (_) {
                                                                  return Padding(
                                                                    padding: EdgeInsetsGeometry.all(15),
                                                                    child: Row(
                                                                      children: [
                                                                        Expanded(
                                                                            child: Column(
                                                                              children: [
                                                                                FittedBox(child: Text('答題結束！', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800, color: Color(0xff3a5a40)),),),
                                                                                SizedBox(height: 20,),
                                                                                FittedBox(child: Text('正確率', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Color(0xff3a5a40)),),),
                                                                                SizedBox(height: 10,),
                                                                                FittedBox(child: Text('${((model.correct / problems.length) * 100).round()} %', style: TextStyle(fontSize: 70, fontWeight: FontWeight.w800, color: Color(0xff415a77)),),),
                                                                                Expanded(child: Image.asset(model.resultImagePath, )),
                                                                                Row(
                                                                                  children: [
                                                                                    Expanded(child: Container(
                                                                                      // 按鈕寬度、高度
                                                                                      // width: 200,
                                                                                      // height: 80,
                                                                                      child: ElevatedButton(
                                                                                        child: Text('有人要當 V 了🥺', style: TextStyle(fontSize: null, fontWeight: null, color: null),),
                                                                                        style: ElevatedButton.styleFrom(
                                                                                          backgroundColor: Color(0xffa3b18a), // 按鈕背景顏色
                                                                                          foregroundColor: Colors.white, // 按鈕文字顏色
                                                                                          shadowColor: Colors.grey, // 按鈕陰影顏色
                                                                                          elevation: 10, // 按鈕陰影大小
                                                                                          shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(28),),
                                                                                        ),
                                                                                        onPressed: () {
                                                                                          // 點擊按鈕事件
                                                                                          if (problems.length == model.globalViewModel.totalProblemsNum) {
                                                                                            context.router.replace(ChallengeRoute());
                                                                                          }
                                                                                          else {
                                                                                            context.router.popUntil((route) => route.settings.name == WordListRoute.name);
                                                                                          }
                                                                                        },
                                                                                      ),
                                                                                    ))
                                                                                  ],
                                                                                )
                                                                              ],
                                                                            )
                                                                        )
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            }
                                                          },
                                                          child: Text("繼續", style: TextStyle(color: Color(0xff3a5a40)),),
                                                        )
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),)
                                          ],
                                        )
                                    );
                                  },
                                );
                              }
                              else {
                                showModalBottomSheet(
                                  isDismissible: false,
                                  enableDrag: false,
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                                  ),
                                  backgroundColor: Color(0xffdad7cd),
                                  builder: (_) {

                                    return Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Row(
                                          children: [
                                            Expanded(child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Image.asset('assets/problems/images/oumua4.png', height: MediaQuery.of(context).size.height * 0.2,),
                                                FittedBox(child: Text("瘋狂倒讚 👎👎", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.red)),),
                                                FittedBox(child: Text("聽力內容：${problem.question}", style: TextStyle(fontSize: 20, color: Colors.black),),),
                                                FittedBox(child: Text("正確答案：${problem.answer}", style: TextStyle(fontSize: 20, color: Color(0xff3a5a40), fontWeight: FontWeight.bold),),),
                                                FittedBox(child: Text("你的答案：${model.userAnswer}", style: TextStyle(fontSize: 15, color: Colors.red),),),
                                                // SizedBox(height: 20),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                            model.next(context);
                                                            if (model.currentIndex == problems.length - 1) {
                                                              model.setImagePath();
                                                              showModalBottomSheet(
                                                                isDismissible: false,
                                                                enableDrag: false,
                                                                context: context,
                                                                shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                                                                ),
                                                                backgroundColor: Color(0xffdad7cd),
                                                                builder: (_) {
                                                                  return Padding(
                                                                    padding: EdgeInsetsGeometry.all(15),
                                                                    child: Row(
                                                                      children: [
                                                                        Expanded(
                                                                            child: Column(
                                                                              children: [
                                                                                FittedBox(child: Text('答題結束！', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800, color: Color(0xff3a5a40)),),),
                                                                                SizedBox(height: 20,),
                                                                                FittedBox(child: Text('正確率', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Color(0xff3a5a40)),),),
                                                                                SizedBox(height: 10,),
                                                                                FittedBox(child: Text('${((model.correct / problems.length) * 100).round()} %', style: TextStyle(fontSize: 70, fontWeight: FontWeight.w800, color: Color(0xff415a77)),),),
                                                                                Expanded(child: Image.asset(model.resultImagePath, )),
                                                                                Row(
                                                                                  children: [
                                                                                    Expanded(child: Container(
                                                                                      // 按鈕寬度、高度
                                                                                      // width: 200,
                                                                                      // height: 80,
                                                                                      child: ElevatedButton(
                                                                                        child: Text('有人要當 V 了🥺', style: TextStyle(fontSize: null, fontWeight: null, color: null),),
                                                                                        style: ElevatedButton.styleFrom(
                                                                                          backgroundColor: Color(0xffa3b18a), // 按鈕背景顏色
                                                                                          foregroundColor: Colors.white, // 按鈕文字顏色
                                                                                          shadowColor: Colors.grey, // 按鈕陰影顏色
                                                                                          elevation: 10, // 按鈕陰影大小
                                                                                          shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(28),),
                                                                                        ),
                                                                                        onPressed: () {
                                                                                          // 點擊按鈕事件
                                                                                          if (problems.length == model.globalViewModel.totalProblemsNum) {
                                                                                            context.router.replace(ChallengeRoute());
                                                                                          }
                                                                                          else {
                                                                                            context.router.popUntil((route) => route.settings.name == WordListRoute.name);
                                                                                          }
                                                                                        },
                                                                                      ),
                                                                                    ))
                                                                                  ],
                                                                                )
                                                                              ],
                                                                            )
                                                                        )
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            }
                                                          },
                                                          child: Text("繼續", style: TextStyle(color: Color(0xff3a5a40)),),
                                                        )
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),)
                                          ],
                                        )
                                    );
                                  },
                                );

                              }
                            }
                            else {
                              if (model.userAnswer == problem.answer) {
                                model.correct += 1;
                                showModalBottomSheet(
                                  isDismissible: false,
                                  enableDrag: false,
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                                  ),
                                  backgroundColor: Color(0xffdad7cd),
                                  builder: (_) {
                                    return Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Row(
                                          children: [
                                            Expanded(child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Image.asset('assets/problems/images/oumua3.png', height: MediaQuery.of(context).size.height * 0.2,),
                                                Text("十分天才", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Color(0xff3a5a40))),
                                                // SizedBox(height: 12),
                                                FittedBox(child: Text("正確答案：${problem.answer}", style: TextStyle(fontSize: 20, color: Color(0xff3a5a40)),),),
                                                // SizedBox(height: 20),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                            model.next(context);
                                                            if (model.currentIndex == problems.length - 1) {
                                                              model.setImagePath();
                                                              showModalBottomSheet(
                                                                isDismissible: false,
                                                                enableDrag: false,
                                                                context: context,
                                                                shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                                                                ),
                                                                backgroundColor: Color(0xffdad7cd),
                                                                builder: (_) {
                                                                  return Padding(
                                                                    padding: EdgeInsetsGeometry.all(15),
                                                                    child: Row(
                                                                      children: [
                                                                        Expanded(
                                                                            child: Column(
                                                                              children: [
                                                                                FittedBox(child: Text('答題結束！', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800, color: Color(0xff3a5a40)),),),
                                                                                SizedBox(height: 20,),
                                                                                FittedBox(child: Text('正確率', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Color(0xff3a5a40)),),),
                                                                                SizedBox(height: 10,),
                                                                                FittedBox(child: Text('${((model.correct / problems.length) * 100).round()} %', style: TextStyle(fontSize: 70, fontWeight: FontWeight.w800, color: Color(0xff415a77)),),),
                                                                                Expanded(child: Image.asset(model.resultImagePath, )),
                                                                                Row(
                                                                                  children: [
                                                                                    Expanded(child: Container(
                                                                                      // 按鈕寬度、高度
                                                                                      // width: 200,
                                                                                      // height: 80,
                                                                                      child: ElevatedButton(
                                                                                        child: Text('有人要當 V 了🥺', style: TextStyle(fontSize: null, fontWeight: null, color: null),),
                                                                                        style: ElevatedButton.styleFrom(
                                                                                          backgroundColor: Color(0xffa3b18a), // 按鈕背景顏色
                                                                                          foregroundColor: Colors.white, // 按鈕文字顏色
                                                                                          shadowColor: Colors.grey, // 按鈕陰影顏色
                                                                                          elevation: 10, // 按鈕陰影大小
                                                                                          shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(28),),
                                                                                        ),
                                                                                        onPressed: () {
                                                                                          // 點擊按鈕事件
                                                                                          if (problems.length == model.globalViewModel.totalProblemsNum) {
                                                                                            context.router.replace(ChallengeRoute());
                                                                                          }
                                                                                          else {
                                                                                            context.router.popUntil((route) => route.settings.name == WordListRoute.name);
                                                                                          }
                                                                                        },
                                                                                      ),
                                                                                    ))
                                                                                  ],
                                                                                )
                                                                              ],
                                                                            )
                                                                        )
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            }
                                                          },
                                                          child: Text("繼續", style: TextStyle(color: Color(0xff3a5a40)),),
                                                        )
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),)
                                          ],
                                        )
                                    );
                                  },
                                );
                              }
                              else {
                                showModalBottomSheet(
                                  isDismissible: false,
                                  enableDrag: false,
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                                  ),
                                  backgroundColor: Color(0xffdad7cd),
                                  builder: (_) {

                                    return Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Row(
                                          children: [
                                            Expanded(child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Image.asset('assets/problems/images/oumua4.png', height: MediaQuery.of(context).size.height * 0.2,),
                                                FittedBox(child: Text("瘋狂倒讚 👎👎", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.red)),),
                                                // SizedBox(height: 12),
                                                FittedBox(child: Text("正確答案：${problem.answer}", style: TextStyle(fontSize: 20, color: Color(0xff3a5a40), fontWeight: FontWeight.bold),),),
                                                FittedBox(child: Text("你的答案：${model.userAnswer}", style: TextStyle(fontSize: 15, color: Colors.red),),),
                                                // SizedBox(height: 20),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                            model.next(context);
                                                            if (model.currentIndex == problems.length - 1) {
                                                              model.setImagePath();
                                                              showModalBottomSheet(
                                                                isDismissible: false,
                                                                enableDrag: false,
                                                                context: context,
                                                                shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                                                                ),
                                                                backgroundColor: Color(0xffdad7cd),
                                                                builder: (_) {
                                                                  return Padding(
                                                                    padding: EdgeInsetsGeometry.all(15),
                                                                    child: Row(
                                                                      children: [
                                                                        Expanded(
                                                                            child: Column(
                                                                              children: [
                                                                                FittedBox(child: Text('答題結束！', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800, color: Color(0xff3a5a40)),),),
                                                                                SizedBox(height: 20,),
                                                                                FittedBox(child: Text('正確率', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Color(0xff3a5a40)),),),
                                                                                SizedBox(height: 10,),
                                                                                FittedBox(child: Text('${((model.correct / problems.length) * 100).round()} %', style: TextStyle(fontSize: 70, fontWeight: FontWeight.w800, color: Color(0xff415a77)),),),
                                                                                Expanded(child: Image.asset(model.resultImagePath, )),
                                                                                Row(
                                                                                  children: [
                                                                                    Expanded(child: Container(
                                                                                      // 按鈕寬度、高度
                                                                                      // width: 200,
                                                                                      // height: 80,
                                                                                      child: ElevatedButton(
                                                                                        child: Text('有人要當 V 了🥺', style: TextStyle(fontSize: null, fontWeight: null, color: null),),
                                                                                        style: ElevatedButton.styleFrom(
                                                                                          backgroundColor: Color(0xffa3b18a), // 按鈕背景顏色
                                                                                          foregroundColor: Colors.white, // 按鈕文字顏色
                                                                                          shadowColor: Colors.grey, // 按鈕陰影顏色
                                                                                          elevation: 10, // 按鈕陰影大小
                                                                                          shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(28),),
                                                                                        ),
                                                                                        onPressed: () {
                                                                                          // 點擊按鈕事件
                                                                                          if (problems.length == model.globalViewModel.totalProblemsNum) {
                                                                                            context.router.replace(ChallengeRoute());
                                                                                          }
                                                                                          else {
                                                                                            context.router.popUntil((route) => route.settings.name == WordListRoute.name);
                                                                                          }
                                                                                        },
                                                                                      ),
                                                                                    ))
                                                                                  ],
                                                                                )
                                                                              ],
                                                                            )
                                                                        )
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            }
                                                          },
                                                          child: Text("繼續", style: TextStyle(color: Color(0xff3a5a40)),),
                                                        )
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),)
                                          ],
                                        )
                                    );
                                  },
                                );

                              }
                            }
                          },
                        ),
                      ))
                    ],
                  )
                ],
              ),
            ),
          );
        },
        modelProvider: () => ExamViewModel(),
    );
  }
}

