import 'dart:convert';

class SongResponse {
  final int id;
  final String name;
  final String description;
  final String? image;
  final String url;
  final String artist;

  const SongResponse({
    required this.id,
    required this.name,
    required this.description,
    this.image,
    required this.url,
    required this.artist,
  });

  factory SongResponse.fromMap(Map<String, dynamic> map) {
    return SongResponse(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      image: map['image'] != null ? map['image'] as String : null,
      url: map['url'] as String,
      artist: map['artist'] as String,
    );
  }

  factory SongResponse.fromJson(String source) =>
      SongResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
