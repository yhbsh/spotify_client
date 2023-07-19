import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../notifiers/current_song_notifier.dart';

class BottomVBarVolumeConrolButtons extends StatelessWidget {
  const BottomVBarVolumeConrolButtons({super.key});

  void _toggleMute(BuildContext context) {
    final notifier = context.read<CurrentSongNotifier>();
    notifier.toggleMute();
  }

  void _setVolume(BuildContext context, double volume) {
    final notifier = context.read<CurrentSongNotifier>();
    notifier.setVolume(volume);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20,
      top: 0,
      bottom: 0,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Selector<CurrentSongNotifier, bool>(
            selector: (_, notifier) => notifier.isMuted,
            builder: (context, isMuted, __) {
              return IconButton(
                style: IconButton.styleFrom(padding: EdgeInsets.zero),
                hoverColor: Colors.white24,
                highlightColor: Colors.grey,
                onPressed: () => _toggleMute(context),
                icon: Icon(
                  switch (isMuted) {
                    false => Icons.volume_up,
                    true => Icons.volume_off,
                  },
                  color: Colors.white,
                ),
              );
            },
          ),
          Selector<CurrentSongNotifier, double>(
            selector: (_, notifier) => notifier.volume,
            builder: (context, volume, __) {
              return Slider(
                value: volume,
                onChanged: (volume) => _setVolume(context, volume),
              );
            },
          ),
        ],
      ),
    );
  }
}
