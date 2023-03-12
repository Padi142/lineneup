import '../../../generic/artist/domain/artist_repository.dart';
import '../../../generic/artist/model/params/upload_artist_photo_params.dart';
import '../../../generic/artist/model/results/photo_upload_result.dart';
import '../../../library/use_case.dart';

class ArtistPhotoUploadUseCase extends UseCase<ArtistPhotoUploadResult, UploadArtistPhotoParams> {
  ArtistRepository repository;

  ArtistPhotoUploadUseCase({
    required this.repository,
  });

  @override
  Future<ArtistPhotoUploadResult> call(params) async {
    final ArtistPhotoUploadResult result = await repository.artistPhotoUpload(params);

    return result;
  }
}
