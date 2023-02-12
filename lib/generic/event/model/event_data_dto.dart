import 'package:json_annotation/json_annotation.dart';

part 'event_data_dto.g.dart';

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
  final String startTime;
  @JsonKey(name: 'end_time')
  final String endTime;
  @JsonKey(name: 'tickets_url')
  final String ticketsUrl;
  @JsonKey(name: 'event_uid')
  final String eventUid;
  @JsonKey(name: 'description')
  final String description;

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
  });

  factory EventDataDto.fromJson(Map<String, dynamic> json) => _$EventDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EventDataDtoToJson(this);
}
