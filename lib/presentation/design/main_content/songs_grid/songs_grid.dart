import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../../../../domain/entities/song.dart';
import '../../../notifiers/songs_notifier.dart';
import 'song_grid_card.dart';

class SongsGrid extends StatefulWidget {
  const SongsGrid({super.key});

  @override
  State<SongsGrid> createState() => _SongsGridState();
}

class _SongsGridState extends State<SongsGrid> {
  late int _crossAxisCount = 6;

  @override
  void didChangeDependencies() {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;

    _crossAxisCount = switch (width) {
      final w when w < 600 => 2,
      final w when w < 900 => 3,
      final w when w < 1200 => 4,
      final w when w < 1500 => 5,
      _ => 6,
    };

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<SongsNotifier, List<Song>>(
      selector: (_, notifier) => notifier.songs,
      builder: (_, songs, __) {
        return Expanded(
          child: GridView.builder(
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _crossAxisCount,
              childAspectRatio: 1 / 1.5,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            itemCount: songs.length,
            itemBuilder: (_, i) => AnimationConfiguration.staggeredGrid(
              position: i,
              columnCount: _crossAxisCount,
              child: ScaleAnimation(
                child: FadeInAnimation(child: SongGridCard(song: songs[i])),
              ),
            ),
          ),
        );
      },
    );
  }
}
