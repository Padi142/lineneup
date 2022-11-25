import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lineneup/src/shared/models/user_model.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = Initial;
  const factory LoginState.notLoggedIn() = NotLoggedIn;
  const factory LoginState.loaded(UserModel user) = Loaded;
  const factory LoginState.failed() = Failed;
}
