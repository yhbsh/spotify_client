import 'package:dartz/dartz.dart';

import '../../../core/interfaces/failure.dart';
import '../../../core/interfaces/usecase.dart';
import '../../repositories/audio_player_repository.dart';

class GetTotalDurationUseCase implements NoParamsFutureUseCase<Duration> {
  final AudioPlayerRepository _repository;

  const GetTotalDurationUseCase(this._repository);

  @override
  Future<Either<Failure, Duration>> call() => _repository.totalDuration;
}
