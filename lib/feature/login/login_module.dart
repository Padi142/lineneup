import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lineneup/feature/login/use_case/apple_login.dart';
import 'package:lineneup/feature/login/use_case/discord_login.dart';
import 'package:lineneup/feature/login/use_case/email_login_use_case.dart';
import 'package:lineneup/feature/login/use_case/google_login.dart';
import 'package:lineneup/feature/login/use_case/login_navigation.dart';
import 'package:lineneup/feature/login/use_case/spotify_login.dart';
import 'package:lineneup/feature/login/view/login_callback_screen.dart';
import 'package:lineneup/feature/login/view/login_screen.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../library/app_module.dart';
import 'bloc/login_bloc.dart';

class LoginModule extends AppModule {
  @override
  void registerNavigation() {
    GetIt.I.registerFactory<LoginNavigation>(() => LoginNavigation());
  }

  @override
  void registerUseCase() {
    GetIt.I.registerFactory<DiscordLoginUseCase>(
      () => DiscordLoginUseCase(),
    );
    GetIt.I.registerFactory<EmailLoginUseCase>(
      () => EmailLoginUseCase(),
    );
    GetIt.I.registerFactory<AppleLoginUseCase>(
      () => AppleLoginUseCase(),
    );
    GetIt.I.registerFactory<GoogleLoginUseCase>(
      () => GoogleLoginUseCase(),
    );
    GetIt.I.registerFactory<SpotifyLoginUseCase>(
      () => SpotifyLoginUseCase(),
    );
  }

  @override
  void registerBloc() {
    GetIt.I.registerFactory<LoginBloc>(
      () => LoginBloc(
        discordLoginUseCase: GetIt.I.get<DiscordLoginUseCase>(),
        loginNavigation: GetIt.I.get<LoginNavigation>(),
        emailLoginUseCase: GetIt.I.get<EmailLoginUseCase>(),
        appleLoginUseCase: GetIt.I.get<AppleLoginUseCase>(),
        googleLoginUseCase: GetIt.I.get<GoogleLoginUseCase>(),
        spotifyLoginUseCase: GetIt.I.get<SpotifyLoginUseCase>(),
      ),
    );
  }

  @override
  void registerScreen() {
    GetIt.I.registerFactory<LoginScreen>(() => LoginScreen());
    GetIt.I.registerFactory<LoginCallbackScreen>(() => LoginCallbackScreen());
  }

  @override
  void registerRoute(routes) {
    routes.add(
      QRoute(
        builder: () => BlocProvider<LoginBloc>(create: (_) => GetIt.I.get<LoginBloc>(), child: GetIt.I.get<LoginScreen>()),
        name: LoginScreen.name,
        path: '/login',
      ),
    );
    routes.add(
      QRoute(
        builder: () => BlocProvider<LoginBloc>(create: (_) => GetIt.I.get<LoginBloc>(), child: GetIt.I.get<LoginCallbackScreen>()),
        name: LoginCallbackScreen.name,
        path: '/login-callback',
      ),
    );
  }
}
