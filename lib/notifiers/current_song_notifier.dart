import 'package:flutter/material.dart';

import '../entities/song.dart';
import '../states/current_song_state.dart';

class CurrentSongNotifier extends ChangeNotifier {
  CurrentSongState _state = const CurrentSongState();
  // create a hard copy of the state
  CurrentSongState get state => _state;

  void play(Song song) {
    _state = _state.copyWith(song: song, status: CurrentSongStatus.playing);
    notifyListeners();
  }

  void pause() {
    _state = _state.copyWith(status: CurrentSongStatus.paused);
    notifyListeners();
  }
}
