import 'package:lineneup/generic/api/event_api.dart';
import 'package:lineneup/generic/event/data/event_data_convertor.dart';
import 'package:lineneup/generic/event/domain/event_repository.dart';

import '../model/params/get_event_params.dart';
import '../model/params/get_user_events_params.dart';
import '../model/results/get_event_result.dart';
import '../model/results/get_events_result.dart';

class EventRepositoryImpl extends EventRepository {
  final EventApi eventApi;

  EventRepositoryImpl({
    required this.eventApi,
  });

  @override
  Future<EventDataResult> getEvent(
    GetEventParams params,
  ) async {
    return eventApi.getEvent(params.id).then((eventDto) {
      return EventDataResult.loaded(
        eventDto.toDomain(),
      );
    }).onError((error, stackTrace) {
      return EventDataResult.failure(error.toString());
    });
  }

  @override
  Future<EventsDataResult> getUserEvents(
    GetUserEventsParams params,
  ) async {
    return eventApi.getUserEvents(params.userUid).then((eventsDto) {
      return EventsDataResult.loaded(
        eventsDto.events.map((it) => it.toDomain()).toList(),
      );
    }).onError((error, stackTrace) {
      return EventsDataResult.failure(error.toString());
    });
  }
}
