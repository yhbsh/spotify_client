import 'package:flutter/material.dart';

import 'bottom_bar_widget.dart';
import 'left_side_bar/left_side_bar_widget.dart';
import 'main_content/main_content_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              LeftSideBarWidget(),
              MainContentWidget(),
            ],
          ),
          BottomBarWidget(),
        ],
      ),
    );
  }
}
