import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lineneup/src/core/bloc/lineup/lineup_state.dart';
import 'package:lineneup/src/core/models/artist_model.dart';
import 'package:lineneup/src/core/models/lineup_model.dart';

part 'lineup_event.dart';

class LineupBloc extends Bloc<LineupEvent, LineupState> {
  LineupBloc() : super(const LineupState.initial()) {
    on<LineupEvent>(_onLineupEvent);
  }
  _onLineupEvent(LineupEvent event, Emitter<LineupState> emit) {
    final lineup = LineupModel(artists: [
      ArtistModel(
          artistName: "Bob Kubert",
          start: DateTime(
            2002,
            1,
            1,
            21,
          ),
          end: DateTime(
            2002,
            1,
            1,
            22,
          )),
      ArtistModel(
          artistName: "Granko Škwára",
          start: DateTime(
            2002,
            1,
            1,
            22,
          ),
          end: DateTime(
            2002,
            1,
            1,
            23,
          )),
      ArtistModel(
          artistName: "Litterbin",
          start: DateTime(
            2002,
            1,
            1,
            23,
          ),
          end: DateTime(
            2002,
            1,
            2,
            0,
          )),
      ArtistModel(
          artistName: "Dj Ketak",
          start: DateTime(
            2002,
            1,
            1,
            0,
          ),
          end: DateTime(
            2002,
            1,
            1,
            2,
          )),
    ]);
    emit(LineupState.loaded(lineup));
  }
}
