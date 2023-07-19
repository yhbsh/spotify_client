import 'song_response.dart';

class WatchSongsResponse {
  final List<SongResponse> songs;
  final int page;
  final int limit;
  final int total;

  const WatchSongsResponse({
    required this.songs,
    required this.page,
    required this.limit,
    required this.total,
  });
}
