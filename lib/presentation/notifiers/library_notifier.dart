import 'package:flutter/material.dart';

import '../../domain/entities/song.dart';

class LibraryNotifier extends ChangeNotifier {
  LibraryNotifier(this.context);

  final BuildContext context;

  final List<Song> _songs = [];
  List<Song> get songs => _songs;

  Future<void> addSong(Song song) async {
    _songs.add(song);
    notifyListeners();
  }

  Future<void> removeSong(Song song) async {
    _songs.remove(song);
    notifyListeners();
  }
}
