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

  @override
  String toString() => 'CurrentSongState(song: $song, status: $status)';

  @override
  bool operator ==(covariant CurrentSongState other) {
    if (identical(this, other)) return true;

    return other.song == song && other.status == status;
  }

  @override
  int get hashCode => song.hashCode ^ status.hashCode;
}

enum CurrentSongStatus { idle, playing, paused }
