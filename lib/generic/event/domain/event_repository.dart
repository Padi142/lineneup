import 'package:lineneup/generic/event/model/params/get_user_events_params.dart';

import '../model/params/create_event_params.dart';
import '../model/params/get_event_params.dart';
import '../model/params/update_event_params.dart';
import '../model/results/event_creation_result.dart';
import '../model/results/get_event_result.dart';
import '../model/results/get_events_result.dart';

abstract class EventRepository {
  Future<EventDataResult> getEvent(
    GetEventParams params,
  );

  Future<EventsDataResult> getUserEvents(
    GetUserEventsParams params,
  );
  Future<EventCreateResult> createEvent(
    CreateEventParams params,
  );
  Future<String> updateEvent(
    UpdateEventParams params,
  );

  // Future<UploadEventCoverResult> eventCoverUpload(
  //   UploadEventCoverParams params,
  // );
}
