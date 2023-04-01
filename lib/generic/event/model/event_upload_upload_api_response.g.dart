// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_upload_upload_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventCoverUploadApiResponse _$EventCoverUploadApiResponseFromJson(
        Map<String, dynamic> json) =>
    EventCoverUploadApiResponse(
      success: json['success'] as String?,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$EventCoverUploadApiResponseToJson(
        EventCoverUploadApiResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error': instance.error,
    };
