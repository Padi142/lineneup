import 'package:lineneup/generic/event/domain/event_repository.dart';
import 'package:lineneup/generic/event/model/params/get_event_params.dart';
import 'package:lineneup/generic/event/model/results/get_event_result.dart';

import '../../../library/use_case.dart';

class GetEventUseCase extends UseCase<EventDataResult, GetEventParams> {
  EventRepository repository;

  GetEventUseCase({
    required this.repository,
  });

  @override
  Future<EventDataResult> call(params) async {
    final EventDataResult result = await repository.getEvent(params);

    return result;
  }
}
