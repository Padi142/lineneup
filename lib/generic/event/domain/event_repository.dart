import 'package:lineneup/generic/event/model/params/get_user_events_params.dart';

import '../../artist/model/params/upload_event_cover_params.dart';
import '../../artist/model/results/upload_event_cover_result.dart';
import '../model/params/get_event_params.dart';
import '../model/results/get_event_result.dart';
import '../model/results/get_events_result.dart';

abstract class EventRepository {
  Future<EventDataResult> getEvent(
    GetEventParams params,
  );

  Future<EventsDataResult> getUserEvents(
    GetUserEventsParams params,
  );

  // Future<UploadEventCoverResult> eventCoverUpload(
  //   UploadEventCoverParams params,
  // );
}
