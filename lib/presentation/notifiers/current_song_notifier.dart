import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/song.dart';
import '../states/current_song_state.dart';

class CurrentSongNotifier extends ChangeNotifier {
  CurrentSongState _state = const CurrentSongState();
  Duration _currentPosition = const Duration();
  Duration _totalDuration = const Duration();

  CurrentSongState get state => _state;
  Duration get currentPosition => _currentPosition;
  Duration get totalDuration => _totalDuration;

  AssetsAudioPlayer get player => AssetsAudioPlayer.withId('current_song')
    ..currentPosition.listen(
      (duration) {
        _currentPosition = duration;
        notifyListeners();
      },
    )
    ..current.listen(
      (playing) {
        if (playing == null) return;

        _totalDuration = playing.audio.duration;
        notifyListeners();
      },
    );

  void setVolume(double volume) {
    player.setVolume(volume);
  }

  void play(Song song) async {
    final currentState = _state;

    _state = _state.copyWith(song: song, status: CurrentSongStatus.playing);
    notifyListeners();

    if (currentState.status == CurrentSongStatus.idle || currentState.song != song) {
      final playable = Audio.network(song.url);
      player.open(playable, autoStart: true);
    } else {
      player.play();
    }
  }

  void pause() {
    _state = _state.copyWith(status: CurrentSongStatus.paused);
    notifyListeners();

    player.pause();
  }

  @override
  void dispose() {
    player.stop();
    player.dispose();
    super.dispose();
  }
}
