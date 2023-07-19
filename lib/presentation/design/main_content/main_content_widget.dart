import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import 'discover_header.dart';
import 'discover_songs_grid/songs_grid.dart';

class MainContentWidget extends StatelessWidget {
  const MainContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: DecoratedBox(
        decoration: BoxDecoration(gradient: ColorManager.mainContentBackgroundGradient),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: DiscoverHeader(),
              ),
              SizedBox(height: 20),
              SongsGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
