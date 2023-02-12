import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../artist/model/artist_data_dto.dart';

part 'artist_api.g.dart';

@RestApi()
abstract class ArtistApi {
  factory ArtistApi(Dio dio) = _ArtistApi;

  @GET(
    '/artists?uid={id}',
  )
  Future<ArtistListDto> getEventArtists(
    @Path() String id,
  );
}
