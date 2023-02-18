import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../use_case/discord_login.dart';
import '../use_case/login_navigation.dart';
import 'login_state.dart';

part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final DiscordLoginUseCase discordLoginUseCase;
  final LoginNavigation loginNavigation;
  LoginBloc({required this.discordLoginUseCase, required this.loginNavigation})
      : super(const LoginState.loading()) {
    on<DiscordLogin>(_onDiscordLogin);
    on<CallbackEvent>(_onCallbackEvent);
  }
  Future<void> _onDiscordLogin(
    DiscordLogin event,
    Emitter<LoginState> emit,
  ) async {
    await discordLoginUseCase.call();
  }

  Future<void> _onCallbackEvent(
    CallbackEvent event,
    Emitter<LoginState> emit,
  ) async {
    try {
      final accessToken = _getUriParam(Uri.base, "access_token=");
      final tokenType = _getUriParam(Uri.base, "token_type=");
      final refreshToken = _getUriParam(Uri.base, "refresh_token=");
      final providerRefreshToken =
          _getUriParam(Uri.base, "provider_refresh_token=");
      final providerToken = _getUriParam(Uri.base, "provider_token=");
      final expiresIn = int.parse(_getUriParam(Uri.base, "expires_in="));

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

String _getUriParam(Uri uri, String param) {
  return uri.toString().split(param)[1].split('&')[0];
}
