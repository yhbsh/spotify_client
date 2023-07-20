import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/song.dart';
import '../../notifiers/current_song_notifier.dart';
import '../../notifiers/library_notifier.dart';
import '../../states/current_song_state.dart';
import '../common/current_song_image.dart';

class CurrentPlayingSongCard extends StatelessWidget {
  const CurrentPlayingSongCard({super.key});

  Future<void> _addOrRemoveLibrarySong(BuildContext context, Song song) {
    final libraryNotifier = context.read<LibraryNotifier>();

    return switch (libraryNotifier.isSongInLibrary(song)) {
      true => libraryNotifier.removeSong(song),
      false => libraryNotifier.addSong(song),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Selector<CurrentSongNotifier, CurrentSongState>(
      selector: (_, notifier) => notifier.state,
      builder: (_, state, __) => Positioned(
        left: 12,
        top: 8,
        bottom: 8,
        child: switch (state.status) {
          CurrentSongStatus.stopped => const SizedBox.shrink(),
          CurrentSongStatus.playing || CurrentSongStatus.paused => Row(
              children: [
                const CurrentSongImage(),
                SizedBox(
                  width: 150,
                  child: Center(
                    child: ListTile(
                      dense: true,
                      contentPadding: const EdgeInsets.only(left: 20),
                      title: Text(
                        state.song!.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      subtitle: Text(
                        state.song!.artist,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  highlightColor: Colors.white24,
                  onPressed: () => _addOrRemoveLibrarySong(context, state.song!),
                  icon: Selector<LibraryNotifier, bool>(
                    selector: (_, notifier) => notifier.isSongInLibrary(state.song!),
                    builder: (_, isSongInLibrary, __) => Icon(
                      isSongInLibrary ? Icons.favorite : Icons.favorite_border,
                    ),
                  ),
                ),
              ],
            ),
        },
      ),
    );
  }
}
