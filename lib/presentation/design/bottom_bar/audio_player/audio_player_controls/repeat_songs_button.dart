import 'package:flutter/material.dart';

class RepeatSongsButton extends StatelessWidget {
  const RepeatSongsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: const BoxConstraints.tightFor(width: 35, height: 35),
      padding: EdgeInsets.zero,
      onPressed: () {},
      icon: const Icon(Icons.repeat, size: 25),
    );
  }
}
