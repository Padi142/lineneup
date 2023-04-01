import 'package:lineneup/generic/event/domain/event_repository.dart';

import '../../../library/use_case.dart';
import '../model/params/create_event_params.dart';
import '../model/results/event_creation_result.dart';

class CreateEventUseCase extends UseCase<EventCreateResult, CreateEventParams> {
  EventRepository repository;

  CreateEventUseCase({
    required this.repository,
  });

  @override
  Future<EventCreateResult> call(params) async {
    final EventCreateResult result = await repository.createEvent(params);

    return result;
  }
}
