import 'package:flutter/material.dart';

import 'audio_player_controls/play_next_song_button.dart';
import 'audio_player_controls/play_pause_audio_button.dart';
import 'audio_player_controls/play_previous_song_button.dart';
import 'audio_player_controls/repeat_songs_button.dart';
import 'audio_player_controls/shuffle_songs_button.dart';
import 'audio_timeline/audio_timeline.dart';

class AudioPlayer extends StatelessWidget {
  const AudioPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(height: 0),
        SizedBox(height: 8),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ShuffleSongsButton(),
              SizedBox(width: 10),
              PlayPreviousSongButton(),
              SizedBox(width: 10),
              PlayPauseAudioButton(),
              SizedBox(width: 10),
              PlayNextSongButton(),
              SizedBox(width: 10),
              RepeatSongsButton(),
            ],
          ),
        ),
        // SizedBox(height: 8),
        Expanded(child: AudioTimeline()),
        SizedBox(height: 4),
      ],
    );
  }
}
