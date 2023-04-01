import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lineneup/generic/artist/model/params/get_artists_params.dart';
import 'package:lineneup/generic/event/model/params/get_event_params.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../../generic/artist/data/get_artists_use_case.dart';
import '../../../generic/event/domain/get_event_use_case.dart';
import '../use_case/lineup_navigation.dart';
import 'lineup_state.dart';

part 'lineup_event.dart';

class LineupBloc extends Bloc<LineupEvent, LineupState> {
  final LineupNavigation lineupNavigation;
  final GetEventUseCase getEventUseCase;
  final GetArtistsUseCase getArtistsUseCase;
  LineupBloc({
    required this.lineupNavigation,
    required this.getArtistsUseCase,
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

    final GetEventParams eventParams = GetEventParams(id: eventId.toString());
    final GetArtistsParams artistsParams = GetArtistsParams(id: eventId.toString());

    final eventResult = await getEventUseCase.call(eventParams);
    final artistsResult = await getArtistsUseCase.call(artistsParams);

    eventResult.map(loaded: (loaded) {
      artistsResult.map(loaded: (artistsLoaded) {
        emit(LineupState.loaded(loaded.event, artistsLoaded.artists));
      }, failure: (failure) {
        emit(const LineupState.error());
      });
    }, failure: (failure) {
      emit(const LineupState.error());
    });
  }
}
