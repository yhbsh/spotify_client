import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../notifiers/current_song_notifier.dart';
import '../../states/current_song_state.dart';
import '../common/current_song_image.dart';

class BottomBarPlayingSongWidget extends StatelessWidget {
  const BottomBarPlayingSongWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final state =
        context.select<CurrentSongNotifier, CurrentSongState>((notifier) => notifier.state);
    return Positioned(
      left: 12,
      top: 8,
      bottom: 8,
      child: switch (state.status) {
        CurrentSongStatus.idle => const SizedBox.shrink(),
        CurrentSongStatus.playing || CurrentSongStatus.paused => Row(
            children: [
              const CurrentSongImage(),
              const SizedBox(width: 12),
              SizedBox(
                width: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.song!.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      state.song!.artist,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              IconButton(
                hoverColor: Colors.white24,
                splashColor: Colors.white,
                highlightColor: Colors.white24,
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
              ),
              IconButton(
                hoverColor: Colors.white24,
                splashColor: Colors.white,
                highlightColor: Colors.white24,
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              ),
            ],
          ),
      },
    );
  }
}
