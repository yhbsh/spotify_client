import 'dart:math' as math;

import 'dtos/responses/song_response.dart';

abstract class FakeSongsResponses {
  static final songsResponses = List.generate(
    200,
    (i) {
      final randomIndex = math.Random(i).nextInt(700);
      return SongResponse(
        id: i,
        name: 'Lorem Ipsum dolor sit amet $i',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
            'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        image: i == randomIndex ? null : 'https://picsum.photos/200/300?random=$i',
        url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
        artist: 'Lorem Ipsum',
      );
    },
  );
}
