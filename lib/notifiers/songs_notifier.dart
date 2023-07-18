import 'package:flutter/material.dart';

import '../data/songs.dart';
import '../entities/song.dart';

class SongsNotifier extends ChangeNotifier {
  final List<Song> _songs = SongsData.songs;
  List<Song> get songs => _songs;
}
