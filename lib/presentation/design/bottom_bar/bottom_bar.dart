import 'package:flutter/material.dart';

import 'audio_player/audio_player.dart';
import 'current_playing_song_card.dart';
import 'volume_conrols.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      height: 720 * 0.11,
      width: double.infinity,
      child: ColoredBox(
        color: colorScheme.background,
        child: const Stack(
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
