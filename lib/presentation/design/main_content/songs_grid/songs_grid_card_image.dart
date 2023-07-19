import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SongsGridCardImage extends StatelessWidget {
  const SongsGridCardImage({
    super.key,
    required this.image,
  });

  final String? image;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: switch (image) {
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
    );
  }
}
