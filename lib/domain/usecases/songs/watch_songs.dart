import 'package:dartz/dartz.dart';
import '../../../data/dtos/requests/watch_songs_request.dart';

import '../../../core/interfaces/failure.dart';
import '../../../core/interfaces/usecase.dart';
import '../../entities/song.dart';
import '../../repositories/songs_repository.dart';

class WatchSongsUseCase implements StreamUseCase<WatchSongsResult, WatchSongsParams> {
  final SongsRepository _repository;

  const WatchSongsUseCase(this._repository);

  @override
  Stream<Either<Failure, WatchSongsResult>> call({required WatchSongsParams params}) {
    final request = WatchSongsRequest(
      page: params.page,
      limit: params.limit,
      search: params.search,
      sort: params.sort,
      order: params.order,
    );

    final stream = _repository.watchSongs(params: request);

    return stream.map(
      (result) => result.fold(
        (failure) => Left(failure),
        (response) => Right(
          WatchSongsResult(
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
            page: response.page,
            limit: response.limit,
            total: response.total,
          ),
        ),
      ),
    );
  }
}

class WatchSongsParams {
  final String? search;
  final String? sort;
  final String? order;
  final int? page;
  final int? limit;

  const WatchSongsParams({
    this.search,
    this.sort,
    this.order,
    this.page,
    this.limit,
  });
}

class WatchSongsResult {
  final List<Song> songs;
  final int page;
  final int limit;
  final int total;

  const WatchSongsResult({
    required this.songs,
    required this.page,
    required this.limit,
    required this.total,
  });
}
