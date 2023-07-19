import 'package:flutter/material.dart';

class LibraryContent extends StatelessWidget {
  const LibraryContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Library Content',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
