import 'package:lineneup/generic/artist/domain/artist_repository.dart';

import '../../../library/use_case.dart';
import '../model/params/search_spotify_artist.dart';
import '../model/results/search_artists_result.dart';

class SearchSpotifyArtistsUseCase extends UseCase<SearchArtistResult, SearchSpotifyArtistParams> {
  ArtistRepository repository;

  SearchSpotifyArtistsUseCase({
    required this.repository,
  });

  @override
  Future<SearchArtistResult> call(params) async {
    final SearchArtistResult result = await repository.searchArtist(params);

    return result;
  }
}
