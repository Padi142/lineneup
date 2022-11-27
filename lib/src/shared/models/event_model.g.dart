// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventModel _$EventModelFromJson(Map<String, dynamic> json) => EventModel(
      eventName: json['Event_name'] as String,
      eventLogo: json['Event_logo'] as String,
      eventUid: json['Event_uid'] as String,
      creatorUid: json['Creator_uid'] as String,
      startTime: DateTime.parse(json['Start_time'] as String),
      endTime: DateTime.parse(json['End_time'] as String),
    );

Map<String, dynamic> _$EventModelToJson(EventModel instance) =>
    <String, dynamic>{
      'Event_name': instance.eventName,
      'Event_logo': instance.eventLogo,
      'Event_uid': instance.eventUid,
      'Creator_uid': instance.creatorUid,
      'Start_time': instance.startTime.toIso8601String(),
      'End_time': instance.endTime.toIso8601String(),
    };
