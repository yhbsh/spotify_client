import 'package:dartz/dartz.dart';

import '../../../core/interfaces/failure.dart';
import '../../../core/interfaces/usecase.dart';
import '../../repositories/audio_player_repository.dart';

class UnmuteUseCase implements NoParamsNoReturnFutureUseCase {
  final AudioPlayerRepository _repository;

  const UnmuteUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call() => _repository.setVolume(volume: 1);
}
