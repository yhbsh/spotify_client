import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/song.dart';
import '../../domain/repositories/audio_player_repository.dart';
import '../../domain/usecases/audio_player/get_total_duration.dart';
import '../../domain/usecases/audio_player/mute.dart';
import '../../domain/usecases/audio_player/open_remote_audio.dart';
import '../../domain/usecases/audio_player/pause.dart';
import '../../domain/usecases/audio_player/resume.dart';
import '../../domain/usecases/audio_player/seek_to.dart';
import '../../domain/usecases/audio_player/set_volume.dart';
import '../../domain/usecases/audio_player/stop.dart';
import '../../domain/usecases/audio_player/unmute.dart';
import '../../domain/usecases/audio_player/watch_current_position.dart';
import '../states/current_song_state.dart';

class CurrentSongNotifier extends ChangeNotifier {
  CurrentSongState _state = const CurrentSongState();
  Duration _currentPosition = const Duration();
  Duration _totalDuration = const Duration();
  bool _isMuted = false;

  CurrentSongState get state => _state;
  Duration get currentPosition => _currentPosition;
  Duration get totalDuration => _totalDuration;
  bool get isMuted => _isMuted;

  CurrentSongNotifier(this.context) {
    _init();
  }

  final BuildContext context;

  void _init() {
    final watchCurrentPositionUseCase = WatchCurrentPositionUseCase(
      context.read<AudioPlayerRepository>(),
    );
    final watchCurrentPositionStream = watchCurrentPositionUseCase();
    watchCurrentPositionStream.forEach(
      (either) => either.fold(
        (failure) => debugPrint('watch current position failure: $failure'),
        (position) {
          _currentPosition = position;
          notifyListeners();
        },
      ),
    );

    final getTotalDurationUseCase = GetTotalDurationUseCase(
      context.read<AudioPlayerRepository>(),
    );
    final getTotalDurationFuture = getTotalDurationUseCase();
    getTotalDurationFuture.then(
      (either) => either.fold(
        (failure) => debugPrint('get total duration failure: $failure'),
        (duration) {
          _totalDuration = duration;
          notifyListeners();
        },
      ),
    );
  }

  Future<void> setVolume(double volume) async {
    final setVolumeUseCase = SetVolumeUseCase(context.read<AudioPlayerRepository>());
    final setVolumeParams = SetVolumeParams(volume);
    final setVolumeResult = await setVolumeUseCase(params: setVolumeParams);

    setVolumeResult.fold(
      (failure) => debugPrint('set volume failure: $failure'),
      (_) {
        switch (volume) {
          case 0:
            _isMuted = true;
            break;
          default:
            _isMuted = false;
            break;
        }
        notifyListeners();
      },
    );
  }

  Future<void> open(Song song) async {
    final openRemoteAudioUseCase = OpenRemoteAudioUseCase(context.read<AudioPlayerRepository>());
    final openRemoteAudioParams = OpenRemoteAudioParams(song.url);
    final openRemoteAudioResult = await openRemoteAudioUseCase(params: openRemoteAudioParams);

    openRemoteAudioResult.fold(
      (failure) => debugPrint('open remote audio failure: $failure'),
      (_) {
        _state = _state.copyWith(song: song, status: CurrentSongStatus.playing);
        notifyListeners();
      },
    );
  }

  Future<void> resume() async {
    final resumeUseCase = ResumeUseCase(context.read<AudioPlayerRepository>());
    final resumeResult = await resumeUseCase();

    resumeResult.fold(
      (failure) => debugPrint('resume failure: $failure'),
      (_) {
        _state = _state.copyWith(status: CurrentSongStatus.playing);
        notifyListeners();
      },
    );
  }

  Future<void> pause() async {
    final pauseUseCase = PauseUseCase(context.read<AudioPlayerRepository>());
    final pauseResult = await pauseUseCase();

    pauseResult.fold(
      (failure) => debugPrint('resume failure: $failure'),
      (_) {
        _state = _state.copyWith(status: CurrentSongStatus.paused);
        notifyListeners();
      },
    );
  }

  Future<void> stop() async {
    final stopUseCase = StopUseCase(context.read<AudioPlayerRepository>());
    final stopResult = await stopUseCase();

    stopResult.fold(
      (failure) => debugPrint('stop failure: $failure'),
      (_) {
        _state = _state.copyWith(status: CurrentSongStatus.idle);
        notifyListeners();
      },
    );
  }

  Future<void> toggleMute() async {
    final muteUseCase = MuteUseCase(context.read<AudioPlayerRepository>());
    final unmuteUseCase = context.read<UnmuteUseCase>();

    switch (_isMuted) {
      case true:
        _isMuted = false;
        notifyListeners();

        await unmuteUseCase();
        break;
      case false:
        _isMuted = true;
        notifyListeners();

        await muteUseCase();
        break;
    }
  }

  Future<void> seekTo(Duration position) async {
    final seekToUseCase = SeekToUseCase(context.read<AudioPlayerRepository>());
    final seekToParams = SeekToParams(position);
    final seekToResult = await seekToUseCase(params: seekToParams);

    seekToResult.fold(
      (failure) => debugPrint('seek to failure: $failure'),
      (_) {
        _currentPosition = position;
        notifyListeners();
      },
    );
  }
}
