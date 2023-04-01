import 'package:json_annotation/json_annotation.dart';

part 'event_data_dto.g.dart';

@JsonSerializable()
class EventListDataDto {
  final List<EventDataDto> events;

  const EventListDataDto({required this.events});

  factory EventListDataDto.fromJson(Map<String, dynamic> json) => _$EventListDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EventListDataDtoToJson(this);
}

@JsonSerializable()
class EventDataDto {
  final int id;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'event_name')
  final String eventName;
  @JsonKey(name: 'event_logo')
  final String eventLogo;
  @JsonKey(name: 'start_time')
  final DateTime startTime;
  @JsonKey(name: 'end_time')
  final DateTime endTime;
  @JsonKey(name: 'tickets_url')
  final String ticketsUrl;
  @JsonKey(name: 'event_uid')
  final String eventUid;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'event_instagram')
  final String eventInstagram;
  @JsonKey(name: 'event_website')
  final String eventWebsite;

  const EventDataDto({
    required this.id,
    required this.createdAt,
    required this.eventName,
    required this.eventLogo,
    required this.startTime,
    required this.description,
    required this.endTime,
    required this.eventUid,
    required this.ticketsUrl,
    required this.eventInstagram,
    required this.eventWebsite,
  });

  factory EventDataDto.fromJson(Map<String, dynamic> json) => _$EventDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EventDataDtoToJson(this);
}
