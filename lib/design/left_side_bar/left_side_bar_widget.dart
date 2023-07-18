import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import 'left_side_bar_tile.dart';

class LeftSideBarWidget extends StatelessWidget {
  const LeftSideBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1280 * .15,
      child: ColoredBox(
        color: ColorManager.sideBarBackgroundColor,
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Image(
                image: AssetImage('assets/spotify_logo.png'),
                fit: BoxFit.cover,
                color: Colors.white,
                filterQuality: FilterQuality.high,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                children: [
                  LeftSideBarTile(
                    onTap: () {},
                    title: 'Home',
                    icon: const Icon(Icons.home, color: Colors.white),
                  ),
                  LeftSideBarTile(
                    onTap: () {},
                    title: 'Search',
                    icon: const Icon(Icons.search, color: Colors.white),
                  ),
                  LeftSideBarTile(
                    onTap: () {},
                    title: 'Your Library',
                    icon: const Icon(Icons.library_music, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
