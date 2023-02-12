import '../model/params/get_artist_params.dart';
import '../model/results/get_artist_result.dart';

abstract class ArtistRepository {
  Future<ArtistDataResult> getArtistsAtEvent(
    GetArtistParams params,
  );
}
