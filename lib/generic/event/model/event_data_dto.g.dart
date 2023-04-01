// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventListDataDto _$EventListDataDtoFromJson(Map<String, dynamic> json) =>
    EventListDataDto(
      events: (json['events'] as List<dynamic>)
          .map((e) => EventDataDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EventListDataDtoToJson(EventListDataDto instance) =>
    <String, dynamic>{
      'events': instance.events,
    };

EventDataDto _$EventDataDtoFromJson(Map<String, dynamic> json) => EventDataDto(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      eventName: json['event_name'] as String,
      eventLogo: json['event_logo'] as String,
      startTime: DateTime.parse(json['start_time'] as String),
      description: json['description'] as String,
      endTime: DateTime.parse(json['end_time'] as String),
      eventUid: json['event_uid'] as String,
      ticketsUrl: json['tickets_url'] as String,
      eventInstagram: json['event_instagram'] as String,
      eventWebsite: json['event_website'] as String,
    );

Map<String, dynamic> _$EventDataDtoToJson(EventDataDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'event_name': instance.eventName,
      'event_logo': instance.eventLogo,
      'start_time': instance.startTime.toIso8601String(),
      'end_time': instance.endTime.toIso8601String(),
      'tickets_url': instance.ticketsUrl,
      'event_uid': instance.eventUid,
      'description': instance.description,
      'event_instagram': instance.eventInstagram,
      'event_website': instance.eventWebsite,
    };
