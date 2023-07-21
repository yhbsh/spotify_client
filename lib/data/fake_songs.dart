import 'dtos/responses/song_response.dart';

abstract class FakeSongsResponses {
  static final songsResponses = List.generate(
    50,
    (i) {
      return SongResponse(
        id: i,
        name: 'Lorem Ipsum dolor sit amet $i',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
            'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        imagesUrls: List.generate(
          2,
          (index) {
            final random = (index + 1) * (i + 1);
            return 'https://picsum.photos/300/300?random=$random';
          },
        ),
        url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
        artist: 'Lorem Ipsum',
      );
    },
  );
}
