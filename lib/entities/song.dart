import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'url': url,
      'artist': artist,
    };
  }

  factory Song.fromMap(Map<String, dynamic> map) {
    return Song(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      image: map['image'] != null ? map['image'] as String : null,
      url: map['url'] as String,
      artist: map['artist'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Song.fromJson(String source) => Song.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Song(id: $id, name: $name, description: $description, image: $image, url: $url, artist: $artist)';
  }

  @override
  bool operator ==(covariant Song other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.image == image &&
        other.url == url &&
        other.artist == artist;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ description.hashCode ^ image.hashCode ^ url.hashCode ^ artist.hashCode;
  }
}
