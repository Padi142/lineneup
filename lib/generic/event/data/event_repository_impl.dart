import 'package:lineneup/generic/api/event_api.dart';
import 'package:lineneup/generic/event/data/event_data_convertor.dart';
import 'package:lineneup/generic/event/domain/event_repository.dart';

import '../model/params/get_event_params.dart';
import '../model/results/get_event_result.dart';

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
}
