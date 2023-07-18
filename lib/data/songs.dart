import 'package:spotify/entities/song.dart';

abstract class SongsData {
  static final songs = List.generate(
    20,
    (i) => Song(
      id: i,
      name: 'Lorem Ipsum dolor sit amet $i',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
          'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      image: 'https://picsum.photos/200/300?random=$i',
    ),
  );
}
