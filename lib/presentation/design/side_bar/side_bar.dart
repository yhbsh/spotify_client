import 'package:flutter/material.dart';

import '../../../main.dart';
import '../common/current_song_image.dart';
import 'side_bar_list_tile.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: 1280 * .15,
      height: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image(
              image: const AssetImage('assets/spotify_logo.png'),
              fit: BoxFit.cover,
              color: colorScheme.onBackground,
              filterQuality: FilterQuality.high,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Column(
              children: [
                SideBarListTile(
                  onTap: () {
                    shellKey.currentState!.pushReplacementNamed('/');
                  },
                  title: 'Home',
                  icon: const Icon(Icons.home),
                ),
                SideBarListTile(
                  onTap: () {},
                  title: 'Search',
                  icon: const Icon(Icons.search),
                ),
                SideBarListTile(
                  onTap: () {
                    shellKey.currentState!.pushReplacementNamed('/library');
                  },
                  title: 'Your Library',
                  icon: const Icon(Icons.library_music),
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
    );
  }
}
