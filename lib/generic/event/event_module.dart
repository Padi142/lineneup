import 'package:get_it/get_it.dart';
import 'package:lineneup/generic/api/event_api.dart';
import 'package:lineneup/generic/event/data/event_repository_impl.dart';
import 'package:lineneup/generic/event/data/get_event_use_case.dart';
import 'package:lineneup/generic/event/domain/event_repository.dart';

import '../../library/app.dart';
import '../../library/app_module.dart';

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
  }
}