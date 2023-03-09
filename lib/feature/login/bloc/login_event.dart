part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class CallbackEvent extends LoginEvent {
  const CallbackEvent();
}

class EmailLogin extends LoginEvent {
  final String email;
  final String password;
  const EmailLogin({required this.email, required this.password});
}

class DiscordLogin extends LoginEvent {
  const DiscordLogin();
}
