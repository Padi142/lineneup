import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lineneup/src/feature/login/bloc/login_state.dart';
import 'package:lineneup/src/feature/login/provider/login_provider.dart';
import 'package:lineneup/src/shared/models/user_model.dart';
import 'package:lineneup/src/shared/navigation.dart';
import 'package:lineneup/src/shared/views/main_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState.initial()) {
    on<InitialEvent>(_onInitial);
    on<GoogleLogin>(_onGoogleLogin);
    on<UriLogin>(_onUriLogin);
  }
  LoginProvider loginProvider = LoginProvider();

  _onInitial(InitialEvent event, Emitter<LoginState> emit) async {
    final session = await SupabaseAuth.instance.initialSession;
    if (session == null) {
      emit(const LoginState.notLoggedIn());
    } else {
      emit(LoginState.loaded(
          UserModel(displayName: session.user.aud, email: "", uid: "")));
    }
  }

  _onGoogleLogin(GoogleLogin event, Emitter<LoginState> emit) async {
    await Supabase.instance.client.auth.signInWithOAuth(
      Provider.google,
    );
  }

  _onUriLogin(UriLogin event, Emitter<LoginState> emit) async {
    try {
      AuthSessionUrlResponse resp = await Supabase.instance.client.auth
          .getSessionFromUrl(
              Uri.parse(event.uri.toString().replaceAll("#/", "#")));
      emit(LoginState.loaded(
          UserModel(displayName: resp.session.user.aud, email: "", uid: "")));
      AppNavigation().push(MainPage.name);
    } catch (e) {
      print(e);
    }
  }
}
