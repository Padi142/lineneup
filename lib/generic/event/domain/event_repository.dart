import '../model/params/get_event_params.dart';
import '../model/results/get_event_result.dart';

abstract class EventRepository {
  Future<EventDataResult> getEvent(
    GetEventParams params,
  );
}
