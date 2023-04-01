import 'package:freezed_annotation/freezed_annotation.dart';

import '../event_model.dart';

part 'get_event_result.freezed.dart';

@freezed
class EventDataResult with _$EventDataResult {
  const factory EventDataResult.loaded(
    EventModel event,
  ) = Loaded;

  const factory EventDataResult.failure(String message) = Failure;
}
