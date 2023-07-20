import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/entities/song.dart';
import '../../../notifiers/library_notifier.dart';

class LibraryContent extends StatelessWidget {
  const LibraryContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<LibraryNotifier, List<Song>>(
      shouldRebuild: (previous, next) => true,
      selector: (_, notifier) => notifier.songs,
      builder: (_, songs, __) => ListView.builder(
        itemCount: songs.length,
        itemBuilder: (_, index) => ListTile(
          leading: switch (songs[index].image) {
            null => const Icon(Icons.music_note),
            final image => CachedNetworkImage(
                imageUrl: image,
                placeholder: (_, __) => const Icon(Icons.music_note),
              ),
          },
          title: Text(songs[index].name),
          subtitle: Text(songs[index].artist),
        ),
      ),
    );
  }
}
