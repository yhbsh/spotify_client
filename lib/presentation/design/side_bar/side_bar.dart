import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../common/current_song_image.dart';
import 'side_bar_list_tile.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

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
                  SideBarListTile(
                    onTap: () {},
                    title: 'Home',
                    icon: const Icon(Icons.home, color: Colors.white),
                  ),
                  SideBarListTile(
                    onTap: () {},
                    title: 'Search',
                    icon: const Icon(Icons.search, color: Colors.white),
                  ),
                  SideBarListTile(
                    onTap: () {},
                    title: 'Your Library',
                    icon: const Icon(Icons.library_music, color: Colors.white),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: CurrentSongImage(),
            ),
          ],
        ),
      ),
    );
  }
}
