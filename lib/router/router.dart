import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:quan_nhau/ui/bottom_navigation_bar/page/bottom_navigation_bar_page.dart';
import 'package:quan_nhau/ui/create_invite/page/create_invite_page.dart';
import 'package:quan_nhau/ui/detail_invite/page/detail_invite_page.dart';
import 'package:quan_nhau/ui/friend/page/friend_page.dart';
import 'package:quan_nhau/ui/home/page/home_page.dart';
import 'package:quan_nhau/ui/profile/page/profile_page.dart';
import 'package:quan_nhau/utils/app_globals.dart';

GoRouter generateRouter() {
  return GoRouter(
    debugLogDiagnostics: kDebugMode,
    navigatorKey: AppGlobals.rootNavKey,
    initialLocation: HomePage.path,
    routes: [_homeRoute(), CreateInvitePage.route(), DetailInvitePage.route()],
  );
}

StatefulShellRoute _homeRoute() => StatefulShellRoute.indexedStack(
  parentNavigatorKey: AppGlobals.rootNavKey,
  builder: (context, state, navigationShell) {
    return BottomNavigationBarPage(navigationShell: navigationShell);
  },
  branches: [
    StatefulShellBranch(routes: [HomePage.route()]),
    StatefulShellBranch(routes: [FriendPage.route()]),
    StatefulShellBranch(routes: [ProfilePage.route()]),
  ],
);
