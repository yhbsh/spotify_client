import 'package:dartz/dartz.dart';
import '../../../data/dtos/requests/fetch_songs_request.dart';

import '../../../core/interfaces/failure.dart';
import '../../../core/interfaces/usecase.dart';
import '../../entities/song.dart';
import '../../repositories/songs_repository.dart';

class FetchSongsUseCase implements FutureUseCase<FetchSongsResult, FetchSongsParams> {
  final SongsRepository _repository;

  const FetchSongsUseCase(this._repository);

  @override
  Future<Either<Failure, FetchSongsResult>> call({required FetchSongsParams params}) async {
    final request = FetchSongsRequest(page: params.page, limit: params.limit);

    final result = await _repository.fetchSongs(params: request);

    return result.fold(
      (failure) => Left(failure),
      (response) => Right(
        FetchSongsResult(
          songs: List<Song>.generate(
            response.songs.length,
            (i) => Song(
              id: response.songs[i].id,
              name: response.songs[i].name,
              url: response.songs[i].url,
              image: response.songs[i].image,
              description: response.songs[i].description,
              artist: response.songs[i].artist,
            ),
          ),
          page: params.page,
        ),
      ),
    );
  }
}

class FetchSongsParams {
  final int page;
  final int limit;

  const FetchSongsParams({
    required this.page,
    required this.limit,
  });
}

class FetchSongsResult {
  final List<Song> songs;
  final int page;

  const FetchSongsResult({required this.songs, required this.page});
}
