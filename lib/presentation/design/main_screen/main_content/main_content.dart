import 'package:flutter/material.dart';

import 'discover_header.dart';
import 'songs_grid/songs_grid.dart';

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 60),
        DiscoverHeader(),
        SizedBox(height: 20),
        SongsGrid(),
      ],
    );
  }
}
