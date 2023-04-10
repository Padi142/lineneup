import 'package:lineneup/generic/artist/domain/artist_repository.dart';

import '../../../library/use_case.dart';
import '../model/params/create_artist_params.dart';

class CreateArtistUseCase extends UseCase<String, CreateArtistParams> {
  ArtistRepository repository;

  CreateArtistUseCase({
    required this.repository,
  });

  @override
  Future<String> call(params) async {
    final String result = await repository.createArtist(params);

    return result;
  }
}
