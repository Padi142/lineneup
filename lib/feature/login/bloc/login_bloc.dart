import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lineneup/feature/login/model/login_params.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../use_case/apple_login.dart';
import '../use_case/discord_login.dart';
import '../use_case/email_login_use_case.dart';
import '../use_case/google_login.dart';
import '../use_case/login_navigation.dart';
import '../use_case/spotify_login.dart';
import 'login_state.dart';

part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final DiscordLoginUseCase discordLoginUseCase;
  final LoginNavigation loginNavigation;
  final EmailLoginUseCase emailLoginUseCase;
  final AppleLoginUseCase appleLoginUseCase;
  final GoogleLoginUseCase googleLoginUseCase;
  final SpotifyLoginUseCase spotifyLoginUseCase;
  LoginBloc({
    required this.discordLoginUseCase,
    required this.loginNavigation,
    required this.emailLoginUseCase,
    required this.appleLoginUseCase,
    required this.googleLoginUseCase,
    required this.spotifyLoginUseCase,
  }) : super(const LoginState.loading()) {
    on<DiscordLogin>(_onDiscordLogin);
    on<EmailLogin>(_onEmailLogin);
    on<CallbackEvent>(_onCallbackEvent);
    on<GoogleLogin>(_onGoogleLogin);
    on<AppleLogin>(_onAppleLogin);
    on<SpotifyEvent>(_onSpotifyEvent);
  }
  Future<void> _onEmailLogin(
    EmailLogin event,
    Emitter<LoginState> emit,
  ) async {
    final params = LoginParams(email: event.email, password: event.password);
    final response = await emailLoginUseCase.call(params);
    if (response == null || response.session == null) {
      loginNavigation.goToHome();
    }
    loginNavigation.goToDashboard();
  }

  Future<void> _onDiscordLogin(
    DiscordLogin event,
    Emitter<LoginState> emit,
  ) async {
    await discordLoginUseCase.call();
  }

  Future<void> _onGoogleLogin(
    GoogleLogin event,
    Emitter<LoginState> emit,
  ) async {
    await googleLoginUseCase.call();
  }

  Future<void> _onAppleLogin(
    AppleLogin event,
    Emitter<LoginState> emit,
  ) async {
    await appleLoginUseCase.call();
  }

  Future<void> _onSpotifyEvent(
    SpotifyEvent event,
    Emitter<LoginState> emit,
  ) async {
    await spotifyLoginUseCase.call();
  }

  Future<void> _onCallbackEvent(
    CallbackEvent event,
    Emitter<LoginState> emit,
  ) async {
    try {
      final accessToken = _getUriParam(QR.params, "access_token");
      final tokenType = _getUriParam(QR.params, "token_type");
      final refreshToken = _getUriParam(QR.params, "refresh_token");
      final providerRefreshToken = _getUriParam(QR.params, "provider_refresh_token");
      final providerToken = _getUriParam(QR.params, "provider_token");
      final expiresIn = int.parse(_getUriParam(QR.params, "expires_in"));

      final url = Uri.parse(
          'line-app.com?access_token=$accessToken&expires_in=$expiresIn&provider_refresh_token=$providerRefreshToken&provider_token=$providerToken&refresh_token=$refreshToken&token_type=$tokenType');

      await Supabase.instance.client.auth.getSessionFromUrl(url);

      loginNavigation.goToDashboard();
    } catch (e) {
      print(e);
      loginNavigation.goToHome();
    }
  }
}

String _getUriParam(QParams params, String param) {
  return params[param].toString();
}
