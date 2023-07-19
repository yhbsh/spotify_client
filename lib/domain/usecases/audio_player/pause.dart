import 'package:dartz/dartz.dart';

import '../../../core/interfaces/failure.dart';
import '../../../core/interfaces/usecase.dart';
import '../../repositories/audio_player_repository.dart';

class PauseUseCase implements NoParamsNoReturnFutureUseCase {
  final AudioPlayerRepository _repository;

  const PauseUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call() => _repository.pause();
}
