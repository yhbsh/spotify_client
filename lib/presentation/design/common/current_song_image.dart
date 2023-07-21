import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../notifiers/current_song_notifier.dart';
import '../../states/current_song_state.dart';

class CurrentSongImage extends StatelessWidget {
  const CurrentSongImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<CurrentSongNotifier, CurrentSongState>(
      selector: (_, notifier) => notifier.state,
      builder: (_, state, __) {
        return switch (state.song?.imagesUrls.length) {
          null || 0 => const SizedBox.shrink(),
          _ => switch (state.status) {
              CurrentSongStatus.stopped => const SizedBox.shrink(),
              CurrentSongStatus.playing || CurrentSongStatus.paused => switch (
                    state.song?.imagesUrls[1]) {
                  null => const SizedBox.expand(),
                  String image => CachedNetworkImage(
                      imageUrl: image,
                      imageBuilder: (_, provider) {
                        return AspectRatio(
                          aspectRatio: 1,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              image: DecorationImage(image: provider, fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        );
                      },
                    ),
                },
            },
        };
      },
    );
  }
}
