import 'package:dartz/dartz.dart';

import '../entities/audio_failure.dart';

abstract interface class AudioPlayerRepository {
  Future<Either<AudioFailure, Unit>> stop();
  Future<Either<AudioFailure, Unit>> pause();
  Future<Either<AudioFailure, Unit>> resume();
  Future<Either<AudioFailure, Unit>> seek({required Duration position});
  Future<Either<AudioFailure, Unit>> setVolume({required double volume});
  Future<Either<AudioFailure, Unit>> openRemoteAudio({required String url});

  Stream<Either<AudioFailure, Duration>> get currentPosition;
  Future<Either<AudioFailure, Duration>> get totalDuration;
}
