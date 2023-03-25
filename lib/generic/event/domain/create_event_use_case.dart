import 'package:lineneup/generic/event/domain/event_repository.dart';

import '../../../library/use_case.dart';
import '../model/params/create_event_params.dart';

class CreateEventUseCase extends UseCase<String, CreateEventParams> {
  EventRepository repository;

  CreateEventUseCase({
    required this.repository,
  });

  @override
  Future<String> call(params) async {
    final String result = await repository.createEvent(params);

    return result;
  }
}
