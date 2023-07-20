import 'package:flutter/material.dart';

class ShuffleSongsButton extends StatelessWidget {
  const ShuffleSongsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return IconButton(
      constraints: const BoxConstraints.tightFor(width: 35, height: 35),
      padding: EdgeInsets.zero,
      onPressed: () {},
      icon: Icon(Icons.shuffle, color: colorScheme.primary, size: 25),
    );
  }
}
