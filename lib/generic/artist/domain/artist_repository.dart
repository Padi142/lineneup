import '../model/params/get_artists_params.dart';
import '../model/results/get_artists_result.dart';

abstract class ArtistRepository {
  Future<ArtistsDataResult> getArtistsAtEvent(
      GetArtistsParams params,
  );
}
