// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventDataDto _$EventDataDtoFromJson(Map<String, dynamic> json) => EventDataDto(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      eventName: json['event_name'] as String,
      eventLogo: json['event_logo'] as String,
      startTime: json['start_time'] as String,
      description: json['description'] as String,
      endTime: json['end_time'] as String,
      eventUid: json['event_uid'] as String,
      ticketsUrl: json['tickets_url'] as String,
    );

Map<String, dynamic> _$EventDataDtoToJson(EventDataDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'event_name': instance.eventName,
      'event_logo': instance.eventLogo,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'tickets_url': instance.ticketsUrl,
      'event_uid': instance.eventUid,
      'description': instance.description,
    };
