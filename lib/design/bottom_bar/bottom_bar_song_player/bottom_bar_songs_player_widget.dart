import 'package:flutter/material.dart';

import 'play_pause_music_button.dart';
import 'play_next_song_button.dart';
import 'play_previous_song_button.dart';
import 'repeat_songs_button.dart';
import 'shuffle_songs_button.dart';
import 'song_timeline_widget.dart';

class BottomBarSongsPlayerWidget extends StatefulWidget {
  const BottomBarSongsPlayerWidget({super.key});

  @override
  State<BottomBarSongsPlayerWidget> createState() => _BottomBarSongsPlayerWidgetState();
}

class _BottomBarSongsPlayerWidgetState extends State<BottomBarSongsPlayerWidget> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 4),
        Expanded(
          flex: 3,
          child: Row(
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
        ),
        SizedBox(height: 4),
        SongTimelineWidget(),
        SizedBox(height: 4),
      ],
    );
  }
}
