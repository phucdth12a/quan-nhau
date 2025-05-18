import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppGlobals {
  static GlobalKey<NavigatorState> rootNavKey = GlobalKey();
  static NavigatorState get nav => rootNavKey.currentState!;
  static BuildContext get context => rootNavKey.currentContext!;
  static String get lastPath =>
      GoRouter.of(
        context,
      ).routerDelegate.currentConfiguration.matches.last.matchedLocation;
}
