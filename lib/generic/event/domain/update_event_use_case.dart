import 'package:lineneup/generic/event/domain/event_repository.dart';

import '../../../library/use_case.dart';
import '../model/params/update_event_params.dart';

class UpdateEventUseCase extends UseCase<String, UpdateEventParams> {
  EventRepository repository;

  UpdateEventUseCase({
    required this.repository,
  });

  @override
  Future<String> call(params) async {
    final String result = await repository.updateEvent(params);

    return result;
  }
}
