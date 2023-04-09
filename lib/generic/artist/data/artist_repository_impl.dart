import 'dart:io';

import 'package:lineneup/generic/artist/data/artist_data_convertor.dart';
import 'package:lineneup/generic/artist/domain/artist_repository.dart';

import '../../api/artist_api.dart';
import '../model/params/create_artist_params.dart';
import '../model/params/get_artists_params.dart';
import '../model/params/search_spotify_artist.dart';
import '../model/params/upload_artist_photo_params.dart';
import '../model/results/get_artists_result.dart';
import '../model/results/photo_upload_result.dart';
import '../model/results/search_artists_result.dart';

class ArtistRepositoryImpl extends ArtistRepository {
  final ArtistApi artistApi;

  ArtistRepositoryImpl({
    required this.artistApi,
  });

  @override
  Future<ArtistsDataResult> getArtistsAtEvent(
    GetArtistsParams params,
  ) async {
    return artistApi.getEventArtists(params.id).then((artistDto) {
      return ArtistsDataResult.loaded(artistDto.artists.map((it) => it.toDomain()).toList());
    }).onError((error, stackTrace) {
      return ArtistsDataResult.failure(error.toString());
    });
  }

  @override
  Future<ArtistPhotoUploadResult> artistPhotoUpload(
    UploadArtistPhotoParams params,
  ) async {
    return artistApi.artistPhotoUpload(params.uid, File(params.file.path)).then((response) {
      if (response.error != null) {
        return ArtistPhotoUploadResult.failure(response.error!);
      }
      return const ArtistPhotoUploadResult.success();
    });
  }

  @override
  Future<String> createArtist(
    CreateArtistParams params,
  ) async {
    return artistApi
        .createArtist(params.artistName, params.eventUid, params.startTime.toIso8601String(), params.endTime.toIso8601String(), params.description, params.spotifyUrl, params.appleUrl,
            params.instagramUrl, params.image)
        .then((response) {
      return response;
    }).onError((error, stackTrace) {
      return 'Error';
    });
  }

  @override
  Future<SearchArtistResult> searchArtist(
    SearchSpotifyArtistParams params,
  ) {
    return artistApi.searchSpotifyArtists(params.artistName).then((response) {
      return SearchArtistResult.loaded(response.toDomain());
    }).onError((error, stackTrace) {
      return SearchArtistResult.failure('Error');
    });
  }
}
