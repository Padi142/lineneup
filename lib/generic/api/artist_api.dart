import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../artist/model/artist_data_dto.dart';
import '../artist/model/artist_photo_upload_api_response.dart';

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

  @POST(
    '/artist_upload?uid={uid}',
  )
  Future<ArtistPhotoUploadApiResponse> artistPhotoUpload(
    @Path() String uid,
    @Part(name: 'file') File file,
  );
}
