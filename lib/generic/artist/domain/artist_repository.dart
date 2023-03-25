import '../model/params/create_artist_params.dart';
import '../model/params/get_artists_params.dart';
import '../model/params/upload_artist_photo_params.dart';
import '../model/results/get_artists_result.dart';
import '../model/results/photo_upload_result.dart';

abstract class ArtistRepository {
  Future<ArtistsDataResult> getArtistsAtEvent(
    GetArtistsParams params,
  );

  Future<ArtistPhotoUploadResult> artistPhotoUpload(
    UploadArtistPhotoParams params,
  );

  Future<String> createArtist(
    CreateArtistParams params,
  );
}
