import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../domain/entities/song.dart';
import '../../../../notifiers/current_song_notifier.dart';
import 'songs_grid_card_image.dart';

class SongGridCard extends StatelessWidget {
  const SongGridCard({
    super.key,
    required this.song,
  });

  final Song song;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<CurrentSongNotifier>().open(song),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade900,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SongsGridCardImage(image: song.imagesUrls[0]),
              const SizedBox(height: 8),
              Expanded(
                child: Text(
                  song.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  song.description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
