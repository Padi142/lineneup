import 'package:get_it/get_it.dart';
import 'package:lineneup/generic/api/event_api.dart';
import 'package:lineneup/generic/event/data/event_repository_impl.dart';
import 'package:lineneup/generic/event/domain/create_event_use_case.dart';
import 'package:lineneup/generic/event/domain/event_repository.dart';
import 'package:lineneup/generic/event/domain/get_event_use_case.dart';

import '../../library/app.dart';
import '../../library/app_module.dart';
import 'domain/get_user_events.dart';
import 'domain/update_event_use_case.dart';

class EventModule extends AppModule {
  @override
  void registerDI() {
    GetIt.I.registerFactory<EventApi>(() => EventApi(dio(App.config.endpoint)));
  }

  @override
  void registerRepo() {
    GetIt.I.registerFactory<EventRepository>(
      () => EventRepositoryImpl(
        eventApi: GetIt.I.get<EventApi>(),
      ),
    );
  }

  @override
  void registerUseCase() {
    GetIt.I.registerFactory<GetEventUseCase>(
      () => GetEventUseCase(
        repository: GetIt.I.get<EventRepository>(),
      ),
    );
    GetIt.I.registerFactory<GetUserEventsUseCase>(
      () => GetUserEventsUseCase(
        repository: GetIt.I.get<EventRepository>(),
      ),
    );
    GetIt.I.registerFactory<CreateEventUseCase>(
      () => CreateEventUseCase(
        repository: GetIt.I.get<EventRepository>(),
      ),
    );
    GetIt.I.registerFactory<UpdateEventUseCase>(
      () => UpdateEventUseCase(
        repository: GetIt.I.get<EventRepository>(),
      ),
    );
  }
}
