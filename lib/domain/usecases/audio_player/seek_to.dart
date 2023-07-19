import 'package:dartz/dartz.dart';

import '../../../core/interfaces/failure.dart';
import '../../../core/interfaces/usecase.dart';
import '../../repositories/audio_player_repository.dart';

class SeekToUseCase implements NoReturnFutureUseCase<SeekToParams> {
  final AudioPlayerRepository _repository;

  const SeekToUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call({required SeekToParams params}) =>
      _repository.seek(position: params.position);
}

class SeekToParams {
  final Duration position;

  const SeekToParams(this.position);
}
