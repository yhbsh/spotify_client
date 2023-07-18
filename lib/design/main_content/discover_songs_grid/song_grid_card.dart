import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../entities/song.dart';

class SongGridCard extends StatelessWidget {
  const SongGridCard({
    super.key,
    required this.song,
  });

  final Song song;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade900,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: switch (song.image) {
                null => const Placeholder(),
                String image => CachedNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.cover,
                    imageBuilder: (_, provider) => DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(4)),
                        image: DecorationImage(image: provider, fit: BoxFit.cover),
                      ),
                    ),
                  ),
              },
            ),
            const Spacer(),
            Text(
              song.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              song.description,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 2,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
