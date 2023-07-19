import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../notifiers/current_song_notifier.dart';

class SongTimelineWidget extends StatelessWidget {
  const SongTimelineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final currentPosition =
        context.select<CurrentSongNotifier, Duration>((notifier) => notifier.currentPosition);
    final totalDuration =
        context.select<CurrentSongNotifier, Duration>((notifier) => notifier.totalDuration);

    return Expanded(
      flex: 2,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            currentPosition.format(),
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
          const SizedBox(width: 10),
          Container(
            height: 5,
            width: 200,
            decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(10)),
          ),
          const SizedBox(width: 10),
          Text(
            totalDuration.format(),
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
        ],
      ),
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
