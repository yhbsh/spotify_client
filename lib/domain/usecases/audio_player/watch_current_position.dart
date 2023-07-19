import 'package:dartz/dartz.dart';

import '../../../core/interfaces/failure.dart';
import '../../../core/interfaces/usecase.dart';
import '../../repositories/audio_player_repository.dart';

class WatchCurrentPositionUseCase implements NoParamsStreamUseCase<Duration> {
  final AudioPlayerRepository _repository;

  const WatchCurrentPositionUseCase(this._repository);

  @override
  Stream<Either<Failure, Duration>> call() => _repository.currentPosition;
}
