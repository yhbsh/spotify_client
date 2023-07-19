import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../domain/entities/song.dart';
import '../../../notifiers/songs_notifier.dart';
import 'song_grid_card.dart';

class SongsGrid extends StatefulWidget {
  const SongsGrid({super.key});

  @override
  State<SongsGrid> createState() => _SongsGridState();
}

class _SongsGridState extends State<SongsGrid> {
  late final SongsNotifier _notifier;
  late final List<Song> _songs;
  late int _crossAxisCount = 6;

  @override
  void initState() {
    _notifier = SongsNotifier(context);
    _songs = _notifier.songs;
    super.initState();
  }

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
  void dispose() {
    _notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        itemCount: _songs.length,
        itemBuilder: (_, i) => AnimationConfiguration.staggeredGrid(
          position: i,
          columnCount: _crossAxisCount,
          child: ScaleAnimation(
            child: FadeInAnimation(child: SongGridCard(song: _songs[i])),
          ),
        ),
      ),
    );
  }
}
