// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistListDto _$ArtistListDtoFromJson(Map<String, dynamic> json) => ArtistListDto(
      artists: (json['artists'] as List<dynamic>).map((e) => ArtistDataDto.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$ArtistListDtoToJson(ArtistListDto instance) => <String, dynamic>{
      'artists': instance.artists,
    };

ArtistDataDto _$ArtistDataDtoFromJson(Map<String, dynamic> json) => ArtistDataDto(
      id: json['id'] as int,
      eventId: json['event_id'] as String,
      artistName: json['artist_name'] as String,
      artistPhoto: json['artist_photo'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      startTime: DateTime.parse(json['start_time'] as String),
      artistUid: json['artist_uid'] as String,
      endTime: DateTime.parse(json['end_time'] as String),
      artistDescription: json['artist_description'] as String,
      appleLink: json['apple_link'] as String,
      instagramLink: json['instagram_link'] as String,
      spotifyLink: json['spotify_link'] as String,
    );

Map<String, dynamic> _$ArtistDataDtoToJson(ArtistDataDto instance) => <String, dynamic>{
      'id': instance.id,
      'event_id': instance.eventId,
      'created_at': instance.createdAt.toIso8601String(),
      'artist_name': instance.artistName,
      'artist_photo': instance.artistPhoto,
      'start_time': instance.startTime.toIso8601String(),
      'end_time': instance.endTime.toIso8601String(),
      'artist_uid': instance.artistUid,
      'artist_description': instance.artistDescription,
      'spotify_link': instance.spotifyLink,
      'apple_link': instance.appleLink,
      'instagram_link': instance.instagramLink,
    };
