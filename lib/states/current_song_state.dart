import '../entities/song.dart';

class CurrentSongState {
  final Song? song;
  final CurrentSongStatus status;

  const CurrentSongState({this.song, this.status = CurrentSongStatus.idle});

  CurrentSongState copyWith({
    Song? song,
    CurrentSongStatus? status,
  }) {
    return CurrentSongState(
      song: song ?? this.song,
      status: status ?? this.status,
    );
  }
}

enum CurrentSongStatus { idle, playing, paused }
