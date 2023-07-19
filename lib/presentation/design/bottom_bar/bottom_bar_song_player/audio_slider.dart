import 'package:flutter/material.dart';

class AudioSlider extends StatelessWidget {
  const AudioSlider({super.key, required this.value, required this.onTapDown});

  final double value;
  final void Function(TapDownDetails) onTapDown;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (_, constraints) {
        return GestureDetector(
          onTapDown: onTapDown,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              SizedBox(
                width: constraints.maxWidth,
                height: 10,
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                width: constraints.maxWidth * value,
                height: 10,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(6),
                    ),
                    color: colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
