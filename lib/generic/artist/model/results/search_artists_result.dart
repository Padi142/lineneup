import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lineneup/generic/artist/model/spotify_artist_search.dart';

part 'search_artists_result.freezed.dart';

@freezed
class SearchArtistResult with _$SearchArtistResult {
  const factory SearchArtistResult.loaded(
    SpotifyArtistList artists,
  ) = Loaded;

  const factory SearchArtistResult.failure(String message) = Failure;
}
