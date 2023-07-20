import 'package:flutter/material.dart';

class PlayNextSongButton extends StatelessWidget {
  const PlayNextSongButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: const BoxConstraints.tightFor(width: 35, height: 35),
      padding: EdgeInsets.zero,
      onPressed: () {},
      icon: const Icon(Icons.skip_next, size: 25),
    );
  }
}
