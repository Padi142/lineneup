import 'package:lineneup/generic/event/domain/event_repository.dart';

import '../../../library/use_case.dart';
import '../model/params/get_user_events_params.dart';
import '../model/results/get_events_result.dart';

class GetUserEventsUseCase
    extends UseCase<EventsDataResult, GetUserEventsParams> {
  EventRepository repository;

  GetUserEventsUseCase({
    required this.repository,
  });

  @override
  Future<EventsDataResult> call(params) async {
    final EventsDataResult result = await repository.getUserEvents(params);

    return result;
  }
}
