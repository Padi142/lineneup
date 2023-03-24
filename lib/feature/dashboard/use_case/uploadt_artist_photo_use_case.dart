import '../../../generic/artist/domain/artist_repository.dart';
import '../../../generic/artist/model/params/upload_artist_photo_params.dart';
import '../../../generic/artist/model/results/photo_upload_result.dart';
import '../../../library/use_case.dart';

class UploadArtistPhotoUseCase
    extends UseCase<ArtistPhotoUploadResult, UploadArtistPhotoParams> {
  ArtistRepository repository;

  UploadArtistPhotoUseCase({
    required this.repository,
  });

  @override
  Future<ArtistPhotoUploadResult> call(params) async {
    final ArtistPhotoUploadResult result =
        await repository.artistPhotoUpload(params);

    return result;
  }
}
