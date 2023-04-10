import 'package:lineneup/generic/event/domain/event_repository.dart';

import '../../../library/use_case.dart';
import '../model/event_model.dart';
import '../model/params/get_user_events_params.dart';
import '../model/results/get_events_result.dart';

class GetUserEventsUseCase extends UseCase<EventsDataResult, GetUserEventsParams> {
  EventRepository repository;

  GetUserEventsUseCase({
    required this.repository,
  });

  @override
  Future<EventsDataResult> call(params) async {
    final EventsDataResult result = await repository.getUserEvents(params);
    if (result is! Loaded) {
      return result;
    }

    return result.copyWith(
        events: result.events
            .map((event) => EventModel(
                  id: event.id,
                  createdAt: event.createdAt,
                  eventName: event.eventName,
                  eventLogo: event.eventLogo,
                  description: event.description,
                  startTime: event.startTime.add(DateTime.now().timeZoneOffset),
                  endTime: event.endTime.add(DateTime.now().timeZoneOffset),
                  eventUid: event.eventUid,
                  ticketsUrl: event.ticketsUrl,
                  eventInstagram: event.eventInstagram,
                  eventWebsite: event.eventWebsite,
                ))
            .toList());
  }
}
