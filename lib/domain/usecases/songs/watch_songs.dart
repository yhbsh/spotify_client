import 'package:dartz/dartz.dart';

import '../../../core/interfaces/failure.dart';
import '../../../core/interfaces/usecase.dart';
import '../../entities/song.dart';

class WatchSongsUseCase implements StreamUseCase<WatchSongsResult, WatchSongsParams> {
  @override
  Stream<Either<Failure, WatchSongsResult>> call({required WatchSongsParams params}) {
    // TODO: implement call
    throw UnimplementedError();
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
