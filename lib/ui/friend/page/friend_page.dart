import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FriendPage extends StatelessWidget {
  const FriendPage({super.key});

  static const path = '/friend';
  static const name = 'friend';

  static GoRoute route() => GoRoute(
    path: path,
    name: name,
    pageBuilder: (context, state) => NoTransitionPage(child: FriendPage()),
  );

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Friends'));
  }
}
