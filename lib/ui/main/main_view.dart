import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oumua/router/app_router.gr.dart';
import 'package:oumua/ui/base/base_view.dart';
import 'package:oumua/ui/main/main_view_model.dart';

@RoutePage()
class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        builder: (context, model, child) {
          return AutoTabsScaffold(
            routes: [
              HomeRoute(),
              WordRoute(),
            ],
            bottomNavigationBuilder: (context, tabsRouter) {
              return BottomNavigationBar(
                  currentIndex: tabsRouter.activeIndex,
                  onTap: tabsRouter.setActiveIndex,
                  items: const [
                    BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: '首頁'),
                    BottomNavigationBarItem(icon: Icon(Icons.wordpress_outlined), activeIcon: Icon(Icons.wordpress), label: '單字')
                  ]
              );
            },
          );
        },
        modelProvider: () => MainViewModel(),
    );
  }
}