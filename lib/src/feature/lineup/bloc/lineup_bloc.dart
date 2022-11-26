import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lineneup/src/feature/lineup/bloc/lineup_state.dart';
import 'package:lineneup/src/feature/lineup/provider/lineup_provider.dart';
import 'package:lineneup/src/shared/models/artist_model.dart';

part 'lineup_event.dart';

class LineupBloc extends Bloc<LineupEvent, LineupState> {
  LineupBloc() : super(const LineupState.initial()) {
    on<GetLineup>(_onLineupEvent);
  }
  LineupProvider lineupProvider = LineupProvider();

  _onLineupEvent(GetLineup event, Emitter<LineupState> emit) async {
    List<ArtistModel>? artists = await lineupProvider.getLineup(event.uid);
    if (artists == null || artists.isEmpty) {
      emit(const LineupState.error());
    } else {
      ArtistModel currentArtist = artists.first;
      List<ArtistModel> upcommingArtists = artists;
      upcommingArtists.remove(currentArtist);

      emit(LineupState.loaded(upcommingArtists, currentArtist));
    }
  }
}
