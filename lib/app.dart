import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quan_nhau/router/router.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final GoRouter routerConfig;

  @override
  void initState() {
    super.initState();
    routerConfig = generateRouter();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        primaryColor: Colors.blue,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.blue,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: routerConfig,
    );
  }
}
