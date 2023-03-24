import 'package:json_annotation/json_annotation.dart';

part 'event_upload_upload_api_response.g.dart';

@JsonSerializable()
class EventCoverUploadApiResponse {
  final String? success;
  final String? error;

  const EventCoverUploadApiResponse({
    required this.success,
    required this.error,
  });

  factory EventCoverUploadApiResponse.fromJson(Map<String, dynamic> json) =>
      _$EventCoverUploadApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EventCoverUploadApiResponseToJson(this);
}
