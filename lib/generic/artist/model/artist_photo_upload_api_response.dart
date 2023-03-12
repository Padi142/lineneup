import 'package:json_annotation/json_annotation.dart';

part 'artist_photo_upload_api_response.g.dart';

@JsonSerializable()
class ArtistPhotoUploadApiResponse {
  final String? success;
  final String? error;

  const ArtistPhotoUploadApiResponse({
    required this.success,
    required this.error,
  });

  factory ArtistPhotoUploadApiResponse.fromJson(Map<String, dynamic> json) => _$ArtistPhotoUploadApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistPhotoUploadApiResponseToJson(this);
}
