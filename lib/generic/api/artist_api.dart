import 'dart:io';

import 'package:dio/dio.dart';
import 'package:lineneup/generic/artist/model/spotify_artist_search_dto.dart';
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
  @POST(
    '/create_artist',
  )
  @MultiPart()
  Future<String> createArtist(
    @Part(name: 'artist_name') String artist_name,
    @Part(name: 'event_uid') String event_uid,
    @Part(name: 'start_time') String start_time,
    @Part(name: 'end_time') String end_time,
    @Part(name: 'description') String description,
    @Part(name: 'spotify') String spotify,
    @Part(name: 'apple') String apple,
    @Part(name: 'instagram') String instagram,
    @Part(name: 'image') String image,
  );

  @GET(
    '/spotify/search_artist?artistName={artistName}',
  )
  Future<SpotifyArtistListDto> searchSpotifyArtists(
    @Path() String artistName,
  );
}
