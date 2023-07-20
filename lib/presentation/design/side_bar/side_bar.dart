import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../notifiers/theme_mode_notifier.dart';
import '../../../main.dart';
import '../common/current_song_image.dart';
import 'side_bar_list_tile.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  void _toggleTheme(BuildContext context) {
    final themeModeNotifier = Provider.of<ThemeModeNotifier>(context, listen: false);
    themeModeNotifier.toggle();
  }

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
          Align(
            child: IconButton(
              onPressed: () => _toggleTheme(context),
              icon: Selector<ThemeModeNotifier, ThemeMode>(
                selector: (_, notifier) => notifier.value,
                builder: (_, themeMode, __) {
                  return Icon(
                    switch (themeMode) {
                      ThemeMode.dark => Icons.light_mode,
                      ThemeMode.light => Icons.dark_mode,
                      ThemeMode.system => Icons.brightness_auto,
                    },
                    color: colorScheme.onBackground,
                  );
                },
              ),
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
