class Song {
  final int id;
  final String name;
  final String description;
  final String? image;
  final String url;
  final String artist;

  const Song({
    required this.id,
    required this.name,
    required this.description,
    this.image,
    required this.url,
    required this.artist,
  });

  @override
  String toString() {
    return 'Song(id: $id, name: $name, description: $description, image: $image, url: $url, artist: $artist)';
  }

  @override
  bool operator ==(covariant Song other) => identical(this, other) || other.id == id;

  @override
  int get hashCode => id.hashCode;
}
