import 'package:flutter/material.dart';

import '../side_bar/side_bar.dart';
import 'bottom_bar/bottom_bar.dart';
import 'main_content/main_content.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SideBar(),
                MainContent(),
              ],
            ),
          ),
          BottomBar(),
        ],
      ),
    );
  }
}
