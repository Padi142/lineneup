import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lineneup/feature/lineup/use_case/lineup_navigation.dart';
import 'package:lineneup/feature/lineup/view/lineup_screen.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../generic/event/data/get_event_use_case.dart';
import '../../library/app_module.dart';
import 'bloc/lineup_bloc.dart';

class LineupModule extends AppModule {
  @override
  void registerNavigation() {
    GetIt.I.registerFactory<LineupNavigation>(() => LineupNavigation());
  }

  @override
  void registerBloc() {
    GetIt.I.registerFactory<LineupBloc>(
      () => LineupBloc(
        lineupNavigation: GetIt.I.get<LineupNavigation>(),
        getEventUseCase: GetIt.I.get<GetEventUseCase>(),
      ),
    );
  }

  @override
  void registerScreen() {
    GetIt.I.registerFactory<LineupScreen>(() => LineupScreen());
  }

  @override
  void registerRoute(routes) {
    routes.add(
      QRoute(
        builder: () => BlocProvider<LineupBloc>(
          create: (_) => GetIt.I.get<LineupBloc>(),
          child: GetIt.I.get<LineupScreen>(),
        ),
        name: LineupScreen.name,
        path: '/lineup/:id',
      ),
    );
  }
}
