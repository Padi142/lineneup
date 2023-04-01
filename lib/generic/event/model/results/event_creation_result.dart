import 'package:json_annotation/json_annotation.dart';

part 'event_creation_result.g.dart';

@JsonSerializable()
class EventCreateResult {
  final String? uid;
  final String? error;
  const EventCreateResult({required this.uid, required this.error});

  factory EventCreateResult.fromJson(Map<String, dynamic> json) => _$EventCreateResultFromJson(json);

  Map<String, dynamic> toJson() => _$EventCreateResultToJson(this);
}
