import 'package:dartz/dartz.dart';

import '../../../core/interfaces/failure.dart';
import '../../../core/interfaces/usecase.dart';
import '../../repositories/audio_player_repository.dart';

class StopUseCase implements NoParamsNoReturnFutureUseCase {
  final AudioPlayerRepository _repository;

  const StopUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call() => _repository.stop();
}
