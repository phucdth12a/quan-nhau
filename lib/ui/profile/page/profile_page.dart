import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const path = '/profile';
  static const name = 'profile';

  static GoRoute route() => GoRoute(
    path: path,
    name: name,
    pageBuilder: (context, state) => NoTransitionPage(child: ProfilePage()),
  );

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Profie'));
  }
}
