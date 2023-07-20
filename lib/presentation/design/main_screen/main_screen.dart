import 'package:flutter/material.dart';

import '../../../main.dart';
import '../side_bar/side_bar.dart';
import '../bottom_bar/bottom_bar.dart';
import 'library_content/library_content.dart';
import 'main_content/main_content.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                const SideBar(),
                const VerticalDivider(),
                Expanded(
                  child: Navigator(
                    key: shellKey,
                    onGenerateRoute: _onGenerateRoute,
                  ),
                ),
              ],
            ),
          ),
          const BottomBar()
        ],
      ),
    );
  }

  Route<dynamic> _onGenerateRoute(RouteSettings settings) => PageRouteBuilder(
        transitionsBuilder: (_, animation, __, child) =>
            FadeTransition(opacity: animation, child: child),
        transitionDuration: const Duration(milliseconds: 100),
        pageBuilder: (_, __, ___) => switch (settings.name) {
          '/' => const MainContent(),
          '/library' => const LibraryContent(),
          _ => throw 'Route not found',
        },
      );
}
