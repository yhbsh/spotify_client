import 'package:flutter/material.dart';

class SongTimelineWidget extends StatelessWidget {
  const SongTimelineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            '00:00',
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
          const SizedBox(width: 10),
          Container(
            height: 5,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            '00:00',
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
