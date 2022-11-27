import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lineneup/src/feature/lineup/bloc/lineup_state.dart';
import 'package:lineneup/src/feature/lineup/provider/lineup_provider.dart';
import 'package:lineneup/src/feature/login/bloc/login_bloc.dart';
import 'package:lineneup/src/shared/models/artist_model.dart';

part 'lineup_event.dart';

class LineupBloc extends Bloc<LineupEvent, LineupState> {
  LineupBloc() : super(const LineupState.initial()) {
    on<GetLineup>(_onLineupEvent);
  }
  LineupProvider lineupProvider = LineupProvider();

  _onLineupEvent(GetLineup event, Emitter<LineupState> emit) async {
    if (event.uid.contains("access_token")) {
      BlocProvider.of<LoginBloc>(event.context).add(UriLogin(
          uri: Uri.parse(
        event.uid,
      )));
    }
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
