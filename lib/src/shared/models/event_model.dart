import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part "event_model.g.dart";

@JsonSerializable()
class EventModel extends Equatable {
  @JsonKey(name: "Event_name")
  final String eventName;
  @JsonKey(name: "Event_logo")
  final String eventLogo;
  @JsonKey(name: "Event_uid")
  final String eventUid;
  @JsonKey(name: "Creator_uid")
  final String creatorUid;
  @JsonKey(name: "Start_time")
  final DateTime startTime;
  @JsonKey(name: "Start_date")
  final DateTime startDate;

  const EventModel({
    required this.eventName,
    required this.eventLogo,
    required this.eventUid,
    required this.creatorUid,
    required this.startTime,
    required this.startDate,
  });

  @override
  List<Object?> get props => [eventName, eventUid, startTime];

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventModelToJson(this);
}
