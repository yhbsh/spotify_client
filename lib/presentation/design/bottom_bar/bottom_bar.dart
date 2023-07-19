import 'package:flutter/material.dart';

import 'audio_player/audio_player.dart';
import 'current_playing_song_card.dart';
import 'volume_conrols.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

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
            CurrentPlayingSongCard(),
            AudioPlayer(),
            VolumeConrols(),
          ],
        ),
      ),
    );
  }
}
