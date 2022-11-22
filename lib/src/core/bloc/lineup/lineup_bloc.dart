import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lineneup/src/core/bloc/lineup/lineup_state.dart';
import 'package:lineneup/src/core/models/artist_model.dart';
import 'package:lineneup/src/core/models/lineup_model.dart';
import 'package:lineneup/src/core/provider/lineup_provider.dart';

part 'lineup_event.dart';

class LineupBloc extends Bloc<LineupEvent, LineupState> {
  LineupBloc() : super(const LineupState.initial()) {
    on<GetLineup>(_onLineupEvent);
  }
  LineupProvider lineupProvider = LineupProvider();

  _onLineupEvent(GetLineup event, Emitter<LineupState> emit) async {
    LineupModel lineup = await lineupProvider.getLineup();
    //int curentHour = DateTime.now().hour;

    ArtistModel currentArtist = lineup.artists.first;
    List<ArtistModel> upcommingArtists = lineup.artists;
    upcommingArtists.remove(currentArtist);

    emit(LineupState.loaded(upcommingArtists, currentArtist));
  }
}
