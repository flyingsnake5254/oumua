import 'package:oumua/core/services/log_service.dart';
import 'package:oumua/locator.dart';
import 'package:oumua/router/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:oumua/ui/base/global_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfiguration().loadFromAsset("app_settings");
  LogService.init();
  setupLocator();
  final GlobalViewModel globalViewModel = locator<GlobalViewModel>();
  globalViewModel.initGlobalViewModel();
  GetIt.instance.registerSingleton<AppRouter>(AppRouter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = GetIt.instance<AppRouter>();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: GlobalConfiguration().getValue("environment") == 'development',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
    );
  }
}