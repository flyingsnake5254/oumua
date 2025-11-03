// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:collection/collection.dart' as _i12;
import 'package:flutter/cupertino.dart' as _i10;
import 'package:oumua/core/models/problem.dart' as _i11;
import 'package:oumua/router/custom_router/empty_router.dart' as _i2;
import 'package:oumua/ui/base/example/example_view.dart' as _i4;
import 'package:oumua/ui/challenge/challenge_view.dart' as _i1;
import 'package:oumua/ui/exam/exam_view.dart' as _i3;
import 'package:oumua/ui/home/home_view.dart' as _i5;
import 'package:oumua/ui/main/main_view.dart' as _i6;
import 'package:oumua/ui/word/word_list/word_list_view.dart' as _i7;
import 'package:oumua/ui/word/word_view.dart' as _i8;

/// generated route for
/// [_i1.ChallengeView]
class ChallengeRoute extends _i9.PageRouteInfo<void> {
  const ChallengeRoute({List<_i9.PageRouteInfo>? children})
    : super(ChallengeRoute.name, initialChildren: children);

  static const String name = 'ChallengeRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i1.ChallengeView();
    },
  );
}

/// generated route for
/// [_i2.EmptyRouterPage]
class EmptyRouter extends _i9.PageRouteInfo<void> {
  const EmptyRouter({List<_i9.PageRouteInfo>? children})
    : super(EmptyRouter.name, initialChildren: children);

  static const String name = 'EmptyRouter';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i2.EmptyRouterPage();
    },
  );
}

/// generated route for
/// [_i3.ExamView]
class ExamRoute extends _i9.PageRouteInfo<ExamRouteArgs> {
  ExamRoute({
    _i10.Key? key,
    required List<_i11.Problem> problems,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         ExamRoute.name,
         args: ExamRouteArgs(key: key, problems: problems),
         initialChildren: children,
       );

  static const String name = 'ExamRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ExamRouteArgs>();
      return _i3.ExamView(key: args.key, problems: args.problems);
    },
  );
}

class ExamRouteArgs {
  const ExamRouteArgs({this.key, required this.problems});

  final _i10.Key? key;

  final List<_i11.Problem> problems;

  @override
  String toString() {
    return 'ExamRouteArgs{key: $key, problems: $problems}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ExamRouteArgs) return false;
    return key == other.key &&
        const _i12.ListEquality<_i11.Problem>().equals(
          problems,
          other.problems,
        );
  }

  @override
  int get hashCode =>
      key.hashCode ^ const _i12.ListEquality<_i11.Problem>().hash(problems);
}

/// generated route for
/// [_i4.ExampleView]
class ExampleRoute extends _i9.PageRouteInfo<void> {
  const ExampleRoute({List<_i9.PageRouteInfo>? children})
    : super(ExampleRoute.name, initialChildren: children);

  static const String name = 'ExampleRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i4.ExampleView();
    },
  );
}

/// generated route for
/// [_i5.HomeView]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i5.HomeView();
    },
  );
}

/// generated route for
/// [_i6.MainView]
class MainRoute extends _i9.PageRouteInfo<void> {
  const MainRoute({List<_i9.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i6.MainView();
    },
  );
}

/// generated route for
/// [_i7.WordListView]
class WordListRoute extends _i9.PageRouteInfo<WordListRouteArgs> {
  WordListRoute({
    _i10.Key? key,
    required String chapter,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         WordListRoute.name,
         args: WordListRouteArgs(key: key, chapter: chapter),
         initialChildren: children,
       );

  static const String name = 'WordListRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WordListRouteArgs>();
      return _i7.WordListView(key: args.key, chapter: args.chapter);
    },
  );
}

class WordListRouteArgs {
  const WordListRouteArgs({this.key, required this.chapter});

  final _i10.Key? key;

  final String chapter;

  @override
  String toString() {
    return 'WordListRouteArgs{key: $key, chapter: $chapter}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WordListRouteArgs) return false;
    return key == other.key && chapter == other.chapter;
  }

  @override
  int get hashCode => key.hashCode ^ chapter.hashCode;
}

/// generated route for
/// [_i8.WordView]
class WordRoute extends _i9.PageRouteInfo<void> {
  const WordRoute({List<_i9.PageRouteInfo>? children})
    : super(WordRoute.name, initialChildren: children);

  static const String name = 'WordRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i8.WordView();
    },
  );
}
