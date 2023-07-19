import 'package:dartz/dartz.dart';

import '../../../core/interfaces/failure.dart';
import '../../../core/interfaces/usecase.dart';
import '../../repositories/audio_player_repository.dart';

class OpenRemoteAudioUseCase implements NoReturnFutureUseCase<OpenRemoteAudioParams> {
  final AudioPlayerRepository _repository;

  const OpenRemoteAudioUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call({required OpenRemoteAudioParams params}) =>
      _repository.openRemoteAudio(url: params.url);
}

class OpenRemoteAudioParams {
  final String url;

  const OpenRemoteAudioParams(this.url);
}
