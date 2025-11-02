import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oumua/ui/base/base_view.dart';
import 'package:oumua/ui/home/home_view_model.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Color(0xFFdad7cd),
          );
        },
        modelProvider: () => HomeViewModel(),
    );
  }
}