import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'home_state.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState.loading()) {
    on<HomeEvent>(_onInitEvent);
  }
  Future<void> _onInitEvent(
    HomeEvent event,
    Emitter<HomeState> emit,
  ) async {}
}
