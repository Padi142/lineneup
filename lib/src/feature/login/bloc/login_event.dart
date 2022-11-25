part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class InitialEvent extends LoginEvent {
  const InitialEvent();

  @override
  List<Object> get props => [];
}

class GoogleLogin extends LoginEvent {
  const GoogleLogin();

  @override
  List<Object> get props => [];
}

class UriLogin extends LoginEvent {
  final Uri uri;
  const UriLogin({required this.uri});

  @override
  List<Object> get props => [];
}
