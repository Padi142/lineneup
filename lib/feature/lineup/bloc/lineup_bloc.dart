import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lineneup/generic/event/model/params/get_event_params.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../../generic/event/data/get_event_use_case.dart';
import '../use_case/lineup_navigation.dart';
import 'lineup_state.dart';

part 'lineup_event.dart';

class LineupBloc extends Bloc<LineupEvent, LineupState> {
  final LineupNavigation lineupNavigation;
  final GetEventUseCase getEventUseCase;
  LineupBloc({
    required this.lineupNavigation,
    required this.getEventUseCase,
  }) : super(const LineupState.loading()) {
    on<InitialEvent>(_onInitialEvent);
  }
  Future<void> _onInitialEvent(
    InitialEvent event,
    Emitter<LineupState> emit,
  ) async {
    emit(const LineupState.loading());

    final eventId = QR.params['id'];
    if (eventId == null) {
      lineupNavigation.goToHome();
      return;
    }

    final GetEventParams params = GetEventParams(id: eventId.toString());

    final result = await getEventUseCase.call(params);

    result.map(loaded: (loaded) {
      emit(LineupState.loaded(loaded.event));
    }, failure: (failure) {
      emit(const LineupState.error());
    });
  }
}
