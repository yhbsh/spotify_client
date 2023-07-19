import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify/presentation/notifiers/songs_notifier.dart';

import '../data/repositories/audio_player_repository_impl.dart';
import '../data/repositories/songs_repository_impl.dart';
import '../domain/repositories/audio_player_repository.dart';
import '../domain/repositories/songs_repository.dart';
import '../presentation/design/main_screen.dart';
import '../presentation/notifiers/current_song_notifier.dart';

class Spotify extends StatelessWidget {
  const Spotify({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SongsRepository>(
          create: (context) => const SongsRepositoryImpl(),
          lazy: true,
        ),
        Provider<AudioPlayerRepository>(
          create: (context) => AudioPlayerRepositoryImpl(AssetsAudioPlayer()),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (context) => CurrentSongNotifier(context),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (context) => SongsNotifier(context),
          lazy: true,
        ),
      ],
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
