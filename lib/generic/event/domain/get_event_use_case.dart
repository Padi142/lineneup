import 'package:lineneup/generic/event/domain/event_repository.dart';
import 'package:lineneup/generic/event/model/params/get_event_params.dart';
import 'package:lineneup/generic/event/model/results/get_event_result.dart';

import '../../../library/use_case.dart';
import '../model/event_model.dart';

class GetEventUseCase extends UseCase<EventDataResult, GetEventParams> {
  EventRepository repository;

  GetEventUseCase({
    required this.repository,
  });

  @override
  Future<EventDataResult> call(params) async {
    final EventDataResult result = await repository.getEvent(params);
    if (result is! Loaded) {
      return result;
    }

    return result.copyWith(
      event: EventModel(
        id: result.event.id,
        createdAt: result.event.createdAt,
        eventName: result.event.eventName,
        eventLogo: result.event.eventLogo,
        description: result.event.description,
        startTime: result.event.startTime.add(DateTime.now().timeZoneOffset),
        endTime: result.event.endTime.add(DateTime.now().timeZoneOffset),
        eventUid: result.event.eventUid,
        ticketsUrl: result.event.ticketsUrl,
        eventInstagram: result.event.eventInstagram,
        eventWebsite: result.event.eventWebsite,
      ),
    );
  }
}
