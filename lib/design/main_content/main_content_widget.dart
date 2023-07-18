import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import 'discover_header.dart';
import 'discover_songs_grid/discover_songs_grid.dart';

class MainContentWidget extends StatelessWidget {
  const MainContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: size.width * .85,
      child: const DecoratedBox(
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
              DiscoverSongsGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
