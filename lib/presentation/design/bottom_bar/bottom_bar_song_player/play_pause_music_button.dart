import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../notifiers/current_song_notifier.dart';
import '../../../states/current_song_state.dart';

class PlayPauseSongButton extends StatelessWidget {
  const PlayPauseSongButton({super.key});

  void _onPressed(BuildContext context) async {
    final notifier = context.read<CurrentSongNotifier>();
    return switch (notifier.state.status) {
      CurrentSongStatus.idle => null,
      CurrentSongStatus.paused => notifier.resume(),
      CurrentSongStatus.playing => notifier.pause()
    };
  }

  @override
  Widget build(BuildContext context) {
    final currentSongState =
        context.select<CurrentSongNotifier, CurrentSongState>((notifier) => notifier.state);
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints.tightFor(width: 35, height: 35),
      onPressed: () => _onPressed(context),
      splashRadius: 10,
      hoverColor: Colors.grey.shade300,
      style: IconButton.styleFrom(backgroundColor: Colors.white),
      highlightColor: Colors.grey.shade400,
      icon: Icon(
        switch (currentSongState.status) {
          CurrentSongStatus.idle || CurrentSongStatus.paused => Icons.play_arrow,
          CurrentSongStatus.playing => Icons.pause,
        },
        size: 25,
      ),
    );
  }
}
