import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/audio_failure.dart';
import '../../domain/repositories/audio_player_repository.dart';

class AudioPlayerRepositoryImpl implements AudioPlayerRepository {
  final AssetsAudioPlayer _player;

  const AudioPlayerRepositoryImpl(this._player);

  @override
  Future<Either<AudioFailure, Unit>> openRemoteAudio({required String url}) async {
    try {
      await _player.open(Audio.network(url));
      return right(unit);
    } catch (e) {
      return left(AudioFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<AudioFailure, Unit>> pause() async {
    try {
      await _player.pause();
      return right(unit);
    } catch (e) {
      return left(AudioFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<AudioFailure, Unit>> resume() async {
    try {
      await _player.play();
      return right(unit);
    } catch (e) {
      return left(AudioFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<AudioFailure, Unit>> seek({required Duration position}) async {
    try {
      await _player.seek(position);
      return right(unit);
    } catch (e) {
      return left(AudioFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<AudioFailure, Unit>> setVolume({required double volume}) async {
    try {
      await _player.setVolume(volume);
      return right(unit);
    } catch (e) {
      return left(AudioFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<AudioFailure, Unit>> stop() async {
    try {
      await _player.stop();
      return right(unit);
    } catch (e) {
      return left(AudioFailure(message: e.toString()));
    }
  }

  @override
  Stream<Either<AudioFailure, Duration>> get currentPosition {
    return _player.currentPosition.map((event) => right(event));
  }

  @override
  Future<Either<AudioFailure, Duration>> get totalDuration async {
    try {
      final infos = await _player.realtimePlayingInfos.first;
      return right(infos.duration);
    } catch (e) {
      return left(AudioFailure(message: e.toString()));
    }
  }
}
