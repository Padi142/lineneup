import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lineneup/generic/artist/domain/search_artist_use_case.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../../../generic/artist/domain/get_artists_use_case.dart';
import '../../../../generic/artist/model/params/get_artists_params.dart';
import '../../../../generic/artist/model/params/search_spotify_artist.dart';
import 'artist_bloc_state.dart';

part 'artist_bloc_event.dart';

class ArtistBloc extends Bloc<ArtistEvent, ArtistState> {
  final GetArtistsUseCase getArtistsUseCase;
  final SearchSpotifyArtistsUseCase searchSpotifyArtistsUseCase;
  ArtistBloc({
    required this.getArtistsUseCase,
    required this.searchSpotifyArtistsUseCase,
  }) : super(const ArtistState.loading()) {
    on<LoadArtists>(_onLoadArtists);
    on<SearchArtistSpotify>(_onSearchArtistSpotify);
    on<SearchInitial>(_onSearchInitial);
    on<ResetSearch>(_onResetSearch);
  }
  Future<void> _onLoadArtists(
    LoadArtists event,
    Emitter<ArtistState> emit,
  ) async {
    String? eventUid;
    if (event.eventId == null) {
      eventUid = QR.params['id'].toString();
    } else {
      eventUid = event.eventId;
    }

    final params = GetArtistsParams(id: eventUid ?? '');

    final result = await getArtistsUseCase(params);

    result.maybeMap(
        loaded: (loaded) {
          emit(ArtistState.loadedArtists(loaded.artists));
        },
        orElse: () {});
  }

  Future<void> _onSearchInitial(
    SearchInitial event,
    Emitter<ArtistState> emit,
  ) async {
    emit(const ArtistState.searchedArtists([]));
  }

  Future<void> _onResetSearch(
    ResetSearch event,
    Emitter<ArtistState> emit,
  ) async {
    emit(const ArtistState.searchedArtists([]));
  }

  Future<void> _onSearchArtistSpotify(
    SearchArtistSpotify event,
    Emitter<ArtistState> emit,
  ) async {
    if (event.name == '') {
      emit(const ArtistState.searchedArtists([]));

      return;
    }
    emit(const ArtistState.loading());
    final params = SearchSpotifyArtistParams(artistName: event.name);
    final response = await searchSpotifyArtistsUseCase.call(params);

    response.map(loaded: (loaded) {
      emit(ArtistState.searchedArtists(loaded.artists.artists));
    }, failure: (failure) {
      emit(const ArtistState.error('error'));
    });
  }
}
