import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 5,
            child: Row(
              children: [
                Flexible(child: Container(color: Colors.greenAccent)),
                Flexible(child: Container(color: Colors.redAccent)),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Flexible(child: Container(color: Colors.yellowAccent)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
