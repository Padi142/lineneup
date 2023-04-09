import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lineneup/generic/artist/model/artist_model.dart';

import '../../../../generic/artist/model/spotify_artist_search.dart';

part 'artist_bloc_state.freezed.dart';

@freezed
abstract class ArtistState with _$ArtistState {
  const factory ArtistState.loading() = Loading;
  const factory ArtistState.error(String error) = Error;
  const factory ArtistState.loadedArtists(List<ArtistModel> artists) = LoadedArtists;
  const factory ArtistState.searchedArtists(SpotifyArtistList artists) = SearchedArtists;
}
