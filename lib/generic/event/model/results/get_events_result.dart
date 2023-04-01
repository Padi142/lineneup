import 'package:freezed_annotation/freezed_annotation.dart';

import '../event_model.dart';

part 'get_events_result.freezed.dart';

@freezed
class EventsDataResult with _$EventsDataResult {
  const factory EventsDataResult.loaded(
    List<EventModel> events,
  ) = Loaded;

  const factory EventsDataResult.failure(String message) = Failure;
}
