import 'package:auto_route/auto_route.dart';
import 'package:oumua/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    // Example
    AutoRoute(
      page: MainRoute.page,
      path: '/',
      initial: true,
      children: [
        AutoRoute(page: HomeRoute.page, path: 'home'),
        AutoRoute(
            page: WordRoute.page, 
            path: 'word',
        ),
      ]
    ),
    AutoRoute(page: WordListRoute.page, path: '/word-list'),
  ];
}
