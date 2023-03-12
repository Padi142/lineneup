import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_upload_result.freezed.dart';

@freezed
class ArtistPhotoUploadResult with _$ArtistPhotoUploadResult {
  const factory ArtistPhotoUploadResult.success() = Success;

  const factory ArtistPhotoUploadResult.failure(String message) = Failure;
}
