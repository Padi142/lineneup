import 'package:lineneup/generic/artist/domain/artist_repository.dart';

import '../../../library/use_case.dart';
import '../model/params/get_artists_params.dart';
import '../model/results/get_artists_result.dart';

class GetArtistsUseCase extends UseCase<ArtistsDataResult, GetArtistsParams> {
  ArtistRepository repository;

  GetArtistsUseCase({
    required this.repository,
  });

  @override
  Future<ArtistsDataResult> call(params) async {
    final ArtistsDataResult result = await repository.getArtistsAtEvent(params);

    return result;
  }
}
