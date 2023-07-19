import 'package:flutter/material.dart';

class DiscoverHeader extends StatelessWidget {
  const DiscoverHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text(
      'Discover',
      style: textTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
