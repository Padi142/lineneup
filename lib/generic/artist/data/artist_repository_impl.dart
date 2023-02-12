import 'package:lineneup/generic/artist/data/artist_data_convertor.dart';
import 'package:lineneup/generic/artist/domain/artist_repository.dart';

import '../../api/artist_api.dart';
import '../model/params/get_artist_params.dart';
import '../model/results/get_artist_result.dart';

class ArtistRepositoryImpl extends ArtistRepository {
  final ArtistApi artistApi;

  ArtistRepositoryImpl({
    required this.artistApi,
  });

  @override
  Future<ArtistDataResult> getArtistsAtEvent(
    GetArtistParams params,
  ) async {
    return artistApi.getEventArtists(params.id).then((artistDto) {
      return ArtistDataResult.loaded(
          artistDto.artists.map((it) => it.toDomain()).toList());
    }).onError((error, stackTrace) {
      return ArtistDataResult.failure(error.toString());
    });
  }
}
