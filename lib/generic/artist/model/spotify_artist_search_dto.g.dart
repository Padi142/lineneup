// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spotify_artist_search_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpotifyArtistListDto _$SpotifyArtistListDtoFromJson(
        Map<String, dynamic> json) =>
    SpotifyArtistListDto(
      artists: (json['artists'] as List<dynamic>)
          .map((e) => SpotifyArtistDataDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpotifyArtistListDtoToJson(
        SpotifyArtistListDto instance) =>
    <String, dynamic>{
      'artists': instance.artists,
    };

SpotifyArtistDataDto _$SpotifyArtistDataDtoFromJson(
        Map<String, dynamic> json) =>
    SpotifyArtistDataDto(
      name: json['name'] as String,
      photos: (json['photos'] as List<dynamic>)
          .map((e) => SpotifyArtisPhotoDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      url: json['url'] as String,
    );

Map<String, dynamic> _$SpotifyArtistDataDtoToJson(
        SpotifyArtistDataDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'photos': instance.photos,
      'url': instance.url,
    };

SpotifyArtisPhotoDto _$SpotifyArtisPhotoDtoFromJson(
        Map<String, dynamic> json) =>
    SpotifyArtisPhotoDto(
      height: (json['height'] as num).toDouble(),
      width: (json['width'] as num).toDouble(),
      url: json['url'] as String,
    );

Map<String, dynamic> _$SpotifyArtisPhotoDtoToJson(
        SpotifyArtisPhotoDto instance) =>
    <String, dynamic>{
      'height': instance.height,
      'width': instance.width,
      'url': instance.url,
    };
