import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_event_cover_result.freezed.dart';

@freezed
class UploadEventCoverResult with _$UploadEventCoverResult {
  const factory UploadEventCoverResult.success() = Success;

  const factory UploadEventCoverResult.failure(String message) = Failure;
}
