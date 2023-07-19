import 'package:flutter/material.dart';

import 'play_pause_music_button.dart';
import 'play_next_song_button.dart';
import 'play_previous_song_button.dart';
import 'repeat_songs_button.dart';
import 'shuffle_songs_button.dart';
import 'song_timeline_widget.dart';

class BottomBarSongsPlayerWidget extends StatelessWidget {
  const BottomBarSongsPlayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 4),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ShuffleMusicButton(),
            SizedBox(width: 10),
            PlayPreviousSongButton(),
            SizedBox(width: 10),
            PlayPauseSongButton(),
            SizedBox(width: 10),
            PlayNextSongButton(),
            SizedBox(width: 10),
            RepeatSongsButton(),
          ],
        ),
        SizedBox(height: 4),
        SongTimelineWidget(),
        SizedBox(height: 4),
      ],
    );
  }
}
