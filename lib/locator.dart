import 'package:oumua/core/services/api_service.dart';
import 'package:oumua/viewmodels/base_view_model.dart';
import 'package:oumua/viewmodels/example_view_model.dart';
import 'package:oumua/viewmodels/global_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => GlobalViewModel());
  locator.registerLazySingleton(() => BaseViewModel());
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => ExampleViewModel());
}