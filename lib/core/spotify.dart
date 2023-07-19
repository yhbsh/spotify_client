import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../presentation/design/main_screen.dart';
import '../presentation/notifiers/current_song_notifier.dart';

class Spotify extends StatelessWidget {
  const Spotify({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: CurrentSongNotifier(),
      child: MaterialApp(
        theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.greenAccent,
          ),
          useMaterial3: true,
        ),
        home: const MainScreen(),
      ),
    );
  }
}
