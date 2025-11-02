import 'package:auto_route/auto_route.dart';
import 'package:oumua/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    // Example
    AutoRoute(
      path: '/example',
      initial: true,
      page: ExampleRoute.page,
    ),

    // 註冊頁面
    // AutoRoute(
    //   path: '/sign-up',
    //   page: SignUpRoute.page,
    //   children: const [],
    // ),
  ];
}
