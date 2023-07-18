import 'package:flutter/material.dart';

import 'bottom_bar_song_controll_volume_slider.dart';

class BottomBarSongControllButtons extends StatelessWidget {
  const BottomBarSongControllButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20,
      top: 0,
      bottom: 0,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.playlist_add),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.volume_up),
          ),
          const BottomBarSongControllVolumeSlider(),
        ],
      ),
    );
  }
}
