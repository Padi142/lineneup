import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lineneup/feature/home/view/home_screen.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../library/app_module.dart';
import 'bloc/home_bloc.dart';

class HomeModule extends AppModule {
  @override
  void registerBloc() {
    GetIt.I.registerFactory<HomeBloc>(
      () => HomeBloc(),
    );
  }

  @override
  void registerScreen() {
    GetIt.I.registerFactory<HomeScreen>(() => HomeScreen());
  }

  @override
  void registerRoute(routes) {
    routes.add(
      QRoute(
        builder: () => BlocProvider<HomeBloc>(
          create: (_) => GetIt.I.get<HomeBloc>(),
          child: GetIt.I.get<HomeScreen>(),
        ),
        name: HomeScreen.name,
        path: '/',
      ),
    );
  }
}
