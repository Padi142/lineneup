import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lineneup/feature/dashboard/bloc/dashboard_bloc.dart';
import 'package:lineneup/feature/dashboard/use_case/dashboard_navigation.dart';
import 'package:lineneup/feature/dashboard/view/dashboard_screen.dart';
import 'package:lineneup/generic/event/domain/get_user_events.dart';
import 'package:lineneup/generic/user/use_case/get_current_session_use_case.dart';
import 'package:lineneup/generic/user/use_case/get_current_user_use_case.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../library/app_module.dart';

class DashboardModule extends AppModule {
  @override
  void registerNavigation() {
    GetIt.I.registerFactory<DashboardNavigation>(() => DashboardNavigation());
  }

  @override
  void registerBloc() {
    GetIt.I.registerFactory<DashboardBloc>(
      () => DashboardBloc(
        dashboardNavigation: GetIt.I.get<DashboardNavigation>(),
        getUserEventsUseCase: GetIt.I.get<GetUserEventsUseCase>(),
        getCurrentSessionUseCase: GetIt.I.get<GetCurrentSessionUseCase>(),
        getCurrentUserUseCase: GetIt.I.get<GetCurrentUserUseCase>(),
      ),
    );
  }

  @override
  void registerScreen() {
    GetIt.I.registerFactory<DashboardScreen>(() => DashboardScreen());
  }

  @override
  void registerRoute(routes) {
    routes.add(
      QRoute(
        builder: () => BlocProvider<DashboardBloc>(
          create: (_) => GetIt.I.get<DashboardBloc>(),
          child: GetIt.I.get<DashboardScreen>(),
        ),
        name: DashboardScreen.name,
        path: '/dashboard',
      ),
    );
  }
}
