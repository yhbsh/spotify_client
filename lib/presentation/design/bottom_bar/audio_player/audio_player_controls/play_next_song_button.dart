import 'package:flutter/material.dart';

class PlayNextSongButton extends StatelessWidget {
  const PlayNextSongButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: const BoxConstraints.tightFor(width: 35, height: 35),
      padding: EdgeInsets.zero,
      onPressed: () {},
      hoverColor: Colors.white24,
      highlightColor: Colors.white38,
      icon: const Icon(
        Icons.skip_next,
        color: Colors.white,
        size: 25,
      ),
    );
  }
}
