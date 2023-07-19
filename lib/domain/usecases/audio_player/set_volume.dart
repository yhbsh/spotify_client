import 'package:dartz/dartz.dart';

import '../../../core/interfaces/failure.dart';
import '../../../core/interfaces/usecase.dart';
import '../../repositories/audio_player_repository.dart';

class SetVolumeUseCase implements NoReturnFutureUseCase<SetVolumeParams> {
  final AudioPlayerRepository _repository;

  const SetVolumeUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call({required SetVolumeParams params}) =>
      _repository.setVolume(volume: params.volume);
}

class SetVolumeParams {
  final double volume;

  const SetVolumeParams(this.volume);
}
