import 'package:oumua/core/services/api_service.dart';
import 'package:oumua/ui/base/base_view_model.dart';
import 'package:oumua/ui/base/example/example_view_model.dart';
import 'package:oumua/ui/base/global_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:oumua/ui/challenge/challenge_view_model.dart';
import 'package:oumua/ui/exam/exam_view_model.dart';
import 'package:oumua/ui/home/home_view_model.dart';
import 'package:oumua/ui/main/main_view_model.dart';
import 'package:oumua/ui/word/word_list/word_list_view_model.dart';
import 'package:oumua/ui/word/word_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => GlobalViewModel());
  locator.registerLazySingleton(() => BaseViewModel());
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => ExampleViewModel());

  locator.registerLazySingleton(() => MainViewModel());
  locator.registerLazySingleton(() => HomeViewModel());
  locator.registerLazySingleton(() => WordViewModel());
  locator.registerLazySingleton(() => WordListViewModel());
  locator.registerLazySingleton(() => ExamViewModel());
  locator.registerLazySingleton(() => ChallengeViewModel());
}