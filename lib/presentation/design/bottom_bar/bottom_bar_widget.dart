import 'package:flutter/material.dart';

import 'bottom_bar_playing_song_widget.dart';
import 'bottom_bar_song_controll_buttons/bottom_bar_song_controll_buttons.dart';
import 'bottom_bar_song_player/bottom_bar_songs_player_widget.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: 720 * 0.1,
      width: size.width,
      child: const ColoredBox(
        color: Colors.black12,
        child: Stack(
          alignment: Alignment.center,
          children: [
            BottomBarPlayingSongWidget(),
            BottomBarSongsPlayerWidget(),
            BottomVBarVolumeConrolButtons(),
          ],
        ),
      ),
    );
  }
}
