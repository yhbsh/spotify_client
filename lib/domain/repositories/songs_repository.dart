import 'package:dartz/dartz.dart';

import '../../core/interfaces/failure.dart';
import '../../data/dtos/requests/fetch_songs_request.dart';
import '../../data/dtos/requests/watch_songs_request.dart';
import '../../data/dtos/responses/fetch_songs_response.dart';
import '../../data/dtos/responses/watch_songs_response.dart';

abstract interface class SongsRepository {
  Future<Either<Failure, FetchSongsResponse>> fetchSongs({required FetchSongsRequest params});
  Stream<Either<Failure, WatchSongsResponse>> watchSongs({required WatchSongsRequest params});
}
