import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oumua/core/models/problem.dart';
import 'package:oumua/router/app_router.gr.dart';
import 'package:oumua/ui/base/base_view.dart';
import 'package:oumua/ui/challenge/challenge_view_model.dart';

@RoutePage()
class ChallengeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Image.asset('assets/problems/images/ao2.png')
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              List<Problem> problems = [];
                              model.globalViewModel.problems.forEach((key, value) {
                                problems.addAll(value);
                              },);
                              for (int i = 0 ; i < problems.length ; i ++) {
                                problems[i].options.shuffle();
                              }
                              context.router.push(ExamRoute(problems: problems));
                            },
                            icon: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset('assets/problems/images/door.png', height: MediaQuery.of(context).size.height * 0.1,),
                            )
                        )
                      ],
                    ))
                  ],
                )
              ],
            ),
          );
        },
        modelProvider: () => ChallengeViewModel(),
    );
  }
}