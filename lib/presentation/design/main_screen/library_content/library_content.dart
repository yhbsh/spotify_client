import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';

class LibraryContent extends StatelessWidget {
  const LibraryContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: DecoratedBox(
        decoration: BoxDecoration(gradient: ColorManager.mainContentBackgroundGradient),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [],
          ),
        ),
      ),
    );
  }
}
