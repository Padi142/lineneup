import 'package:json_annotation/json_annotation.dart';

part 'spotify_artist_search_dto.g.dart';

@JsonSerializable()
class SpotifyArtistListDto {
  @JsonKey(name: 'artists')
  final List<SpotifyArtistDataDto> artists;

  const SpotifyArtistListDto({
    required this.artists,
  });

  factory SpotifyArtistListDto.fromJson(Map<String, dynamic> json) => _$SpotifyArtistListDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SpotifyArtistListDtoToJson(this);
}

@JsonSerializable()
class SpotifyArtistDataDto {
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'photos')
  final List<SpotifyArtisPhotoDto> photos;
  @JsonKey(name: 'url')
  final String url;

  const SpotifyArtistDataDto({
    required this.name,
    required this.photos,
    required this.url,
  });

  factory SpotifyArtistDataDto.fromJson(Map<String, dynamic> json) => _$SpotifyArtistDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SpotifyArtistDataDtoToJson(this);
}

@JsonSerializable()
class SpotifyArtisPhotoDto {
  @JsonKey(name: 'height')
  final double height;
  @JsonKey(name: 'width')
  final double width;
  @JsonKey(name: 'url')
  final String url;

  const SpotifyArtisPhotoDto({
    required this.height,
    required this.width,
    required this.url,
  });
  factory SpotifyArtisPhotoDto.fromJson(Map<String, dynamic> json) => _$SpotifyArtisPhotoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SpotifyArtisPhotoDtoToJson(this);
}
