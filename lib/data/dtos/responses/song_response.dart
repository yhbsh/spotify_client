import 'dart:convert';

class SongResponse {
  final int id;
  final String name;
  final String description;
  final List<String?> imagesUrls;
  final String url;
  final String artist;

  const SongResponse({
    required this.id,
    required this.name,
    required this.description,
    this.imagesUrls = const [],
    required this.url,
    required this.artist,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'imagesUrls': imagesUrls,
      'url': url,
      'artist': artist,
    };
  }

  factory SongResponse.fromMap(Map<String, dynamic> map) {
    return SongResponse(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      imagesUrls: List<String?>.from((map['imagesUrls'] as List<String?>)),
      url: map['url'] as String,
      artist: map['artist'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SongResponse.fromJson(String source) =>
      SongResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
