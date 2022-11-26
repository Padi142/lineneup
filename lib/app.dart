import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lineneup/src/feature/lineup/bloc/lineup_bloc.dart';
import 'package:lineneup/src/feature/lineup/view/lineup_page.dart';
import 'package:lineneup/src/feature/login/bloc/login_bloc.dart';
import 'package:lineneup/src/feature/login/view/login_callback_page.dart';
import 'package:lineneup/src/feature/login/view/login_page.dart';
import 'package:lineneup/src/feature/user/bloc/user_bloc.dart';
import 'package:lineneup/src/feature/user/view/user_page.dart';
import 'package:lineneup/src/shared/views/main_page.dart';
import 'package:qlevar_router/qlevar_router.dart';

class LineupApp extends StatelessWidget {
  const LineupApp({
    Key? key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LineupBloc>(
            create: (BuildContext context) => LineupBloc(),
          ),
          BlocProvider<LoginBloc>(
            create: (BuildContext context) => LoginBloc(),
          ),
          BlocProvider<UserBloc>(
            create: (BuildContext context) => UserBloc(),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: "Lineup",
          theme: ThemeData(
              primaryColor: const Color(0xFFE94560),
              highlightColor: const Color(0xFF4555E9),
              dividerColor: const Color(0xFFC403B1),
              scaffoldBackgroundColor: Colors.purpleAccent,
              textTheme: GoogleFonts.poppinsTextTheme()),
          routeInformationParser: const QRouteInformationParser(),
          routerDelegate: QRouterDelegate(routes, initPath: '/'),
        ));
  }
}

List<QRoute> routes = [
  QRoute(
    builder: () => const MainPage(),
    middleware: [
      //AuthMiddleware(loadUserUseCase: di.get<LoadUserUseCase>()),
    ],
    name: MainPage.name,
    path: '/',
  ),
  QRoute(
    builder: () => const LoginPage(),
    middleware: [
      //AuthMiddleware(loadUserUseCase: di.get<LoadUserUseCase>()),
    ],
    name: LoginPage.name,
    path: '/login',
  ),
  QRoute(
    builder: () => const LoginCallbackPage(),
    middleware: [
      //AuthMiddleware(loadUserUseCase: di.get<LoadUserUseCase>()),
    ],
    name: LoginCallbackPage.name,
    path: '/login-callback',
  ),
  QRoute(
    builder: () => const UserPage(),
    middleware: [
      //AuthMiddleware(loadUserUseCase: di.get<LoadUserUseCase>()),
    ],
    name: UserPage.name,
    path: '/home',
  ),
  QRoute(
    builder: () => const LineupPage(),
    middleware: [
      //AuthMiddleware(loadUserUseCase: di.get<LoadUserUseCase>()),
    ],
    name: LineupPage.name,
    path: '/:uid',
  ),
];
