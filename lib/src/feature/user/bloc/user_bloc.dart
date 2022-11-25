import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lineneup/src/feature/login/bloc/login_state.dart';
import 'package:lineneup/src/feature/user/bloc/user_state.dart';
import 'package:lineneup/src/feature/user/provider/user_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState.initial()) {
    on<GetUserEvents>(_onGetUserEvents);
  }
  UserProvider userProvider = UserProvider();

  _onGetUserEvents(GetUserEvents event, Emitter<UserState> emit) async {
    final uid = Supabase.instance.client.auth.currentUser?.id;
    if (uid == null) {
      emit(const UserState.failed());
    } else {
      final events = await userProvider.getUserEvents(uid);
      if (events != null) {
        emit(UserState.loaded(events));
      } else {
        emit(const UserState.failed());
      }
    }
  }
}
