import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/song.dart';
import '../../domain/usecases/songs/fetch_songs.dart';
import '../../domain/usecases/songs/watch_songs.dart';

class SongsNotifier extends ChangeNotifier {
  List<Song> _songs = [];
  List<Song> get songs => _songs;

  SongsNotifier(BuildContext context) {
    // _fetchSongs(context);
    _watchSongs(context);
  }

  void _watchSongs(BuildContext context) {
    final usecase = context.read<WatchSongsUseCase>();
    const params = WatchSongsParams();
    final stream = usecase(params: params);
    stream.forEach(
      (either) {
        either.fold(
          (failure) => debugPrint('watch songs failure: $failure'),
          (result) {
            _songs = result.songs;
            notifyListeners();
          },
        );
      },
    );
  }

  Future<void> _fetchSongs(BuildContext context) async {
    final usecase = context.read<FetchSongsUseCase>();
    const params = FetchSongsParams(query: 'Discover', page: 1);

    final either = await usecase(params: params);
    either.fold(
      (failure) => debugPrint('fetch songs failure: $failure'),
      (result) {
        _songs.addAll(result.songs);
        notifyListeners();
      },
    );
  }
}
