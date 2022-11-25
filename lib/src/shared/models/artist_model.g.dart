// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistModel _$ArtistModelFromJson(Map<String, dynamic> json) => ArtistModel(
      artistName: json['Artist_name'] as String,
      artistPhoto: json['Artist_photo'] as String,
      artistUid: json['Artist_uid'] as String,
      eventId: json['Event'] as int,
      startTime: DateTime.parse(json['Start_time'] as String),
      endTime: DateTime.parse(json['End_time'] as String),
    );

Map<String, dynamic> _$ArtistModelToJson(ArtistModel instance) =>
    <String, dynamic>{
      'Artist_name': instance.artistName,
      'Artist_photo': instance.artistPhoto,
      'Artist_uid': instance.artistUid,
      'Event': instance.eventId,
      'Start_time': instance.startTime.toIso8601String(),
      'End_time': instance.endTime.toIso8601String(),
    };
