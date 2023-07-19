import 'package:dartz/dartz.dart';

import '../../../core/interfaces/failure.dart';
import '../../../core/interfaces/usecase.dart';
import '../../entities/song.dart';

class FetchSongsUseCase implements FutureUseCase<FetchSongsResult, FetchSongsParams> {
  // final SongsRepository _repository;

  // const FetchSongsUseCase(this._repository);

  @override
  Future<Either<Failure, FetchSongsResult>> call({required FetchSongsParams params}) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class FetchSongsParams {
  final String query;
  final int page;

  const FetchSongsParams({required this.query, required this.page});
}

class FetchSongsResult {
  final List<Song> songs;
  final int page;

  const FetchSongsResult({required this.songs, required this.page});
}
