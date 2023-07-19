import 'package:dartz/dartz.dart';

import '../../core/interfaces/failure.dart';
import '../../domain/repositories/songs_repository.dart';
import '../dtos/requests/fetch_songs_request.dart';
import '../dtos/requests/watch_songs_request.dart';
import '../dtos/responses/fetch_songs_response.dart';
import '../dtos/responses/watch_songs_response.dart';
import '../songs.dart';

class SongsRepositoryImpl implements SongsRepository {
  @override
  Future<Either<Failure, FetchSongsResponse>> fetchSongs({required FetchSongsRequest params}) {
    final response = FetchSongsResponse(
      songs: FakeSongsResponses.songsResponses,
      page: 1,
    );

    return Future.value(right(response));
  }

  @override
  Stream<Either<Failure, WatchSongsResponse>> watchSongs({required WatchSongsRequest params}) {
    final response = WatchSongsResponse(
      songs: FakeSongsResponses.songsResponses,
      page: 1,
      limit: 10,
      total: 100,
    );

    return Stream.value(right(response));
  }
}
