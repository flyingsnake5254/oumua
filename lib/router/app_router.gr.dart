// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/cupertino.dart' as _i8;
import 'package:oumua/router/custom_router/empty_router.dart' as _i1;
import 'package:oumua/ui/base/example/example_view.dart' as _i2;
import 'package:oumua/ui/home/home_view.dart' as _i3;
import 'package:oumua/ui/main/main_view.dart' as _i4;
import 'package:oumua/ui/word/word_list/word_list_view.dart' as _i5;
import 'package:oumua/ui/word/word_view.dart' as _i6;

/// generated route for
/// [_i1.EmptyRouterPage]
class EmptyRouter extends _i7.PageRouteInfo<void> {
  const EmptyRouter({List<_i7.PageRouteInfo>? children})
    : super(EmptyRouter.name, initialChildren: children);

  static const String name = 'EmptyRouter';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.EmptyRouterPage();
    },
  );
}

/// generated route for
/// [_i2.ExampleView]
class ExampleRoute extends _i7.PageRouteInfo<void> {
  const ExampleRoute({List<_i7.PageRouteInfo>? children})
    : super(ExampleRoute.name, initialChildren: children);

  static const String name = 'ExampleRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.ExampleView();
    },
  );
}

/// generated route for
/// [_i3.HomeView]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return _i3.HomeView();
    },
  );
}

/// generated route for
/// [_i4.MainView]
class MainRoute extends _i7.PageRouteInfo<void> {
  const MainRoute({List<_i7.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return _i4.MainView();
    },
  );
}

/// generated route for
/// [_i5.WordListView]
class WordListRoute extends _i7.PageRouteInfo<WordListRouteArgs> {
  WordListRoute({
    _i8.Key? key,
    required String chapter,
    List<_i7.PageRouteInfo>? children,
  }) : super(
         WordListRoute.name,
         args: WordListRouteArgs(key: key, chapter: chapter),
         initialChildren: children,
       );

  static const String name = 'WordListRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WordListRouteArgs>();
      return _i5.WordListView(key: args.key, chapter: args.chapter);
    },
  );
}

class WordListRouteArgs {
  const WordListRouteArgs({this.key, required this.chapter});

  final _i8.Key? key;

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
/// [_i6.WordView]
class WordRoute extends _i7.PageRouteInfo<void> {
  const WordRoute({List<_i7.PageRouteInfo>? children})
    : super(WordRoute.name, initialChildren: children);

  static const String name = 'WordRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return _i6.WordView();
    },
  );
}
