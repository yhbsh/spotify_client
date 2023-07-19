import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../notifiers/current_song_notifier.dart';
import '../../../states/current_song_state.dart';
import 'audio_slider.dart';

class SongTimelineWidget extends StatelessWidget {
  const SongTimelineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Selector<CurrentSongNotifier, Duration>(
          selector: (_, notifier) => notifier.currentPosition,
          builder: (_, currentPosition, __) => Text(
            currentPosition.format(),
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
        const SizedBox(width: 10),
        Consumer<CurrentSongNotifier>(
          builder: (_, notifier, __) {
            return SizedBox(
              width: 200,
              child: AudioSlider(
                value: switch (notifier.state.status) {
                  CurrentSongStatus.idle => 0,
                  _ =>
                    notifier.currentPosition.inMilliseconds / notifier.totalDuration.inMilliseconds,
                },
                onTapDown: (details) {
                  final fraction = details.localPosition.dx / 200;
                  final positionDuration = notifier.totalDuration * fraction;
                  notifier.seekTo(positionDuration);
                },
              ),
            );
          },
        ),
        const SizedBox(width: 10),
        Selector<CurrentSongNotifier, Duration>(
          selector: (_, notifier) => notifier.totalDuration,
          builder: (_, totalDuration, __) => Text(
            totalDuration.format(),
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

extension FormatX on Duration {
  String format() {
    final minutes = inMinutes.toString().padLeft(2, '0');
    final seconds = inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
