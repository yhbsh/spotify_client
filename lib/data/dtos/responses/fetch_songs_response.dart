import 'song_response.dart';

class FetchSongsResponse {
  final List<SongResponse> songs;
  final int page;

  const FetchSongsResponse({required this.songs, required this.page});
}
