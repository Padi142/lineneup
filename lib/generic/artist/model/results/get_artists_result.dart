import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lineneup/generic/artist/model/artist_model.dart';

part 'get_artists_result.freezed.dart';

@freezed
class ArtistsDataResult with _$ArtistsDataResult {
  const factory ArtistsDataResult.loaded(
    List<ArtistModel> artists,
  ) = Loaded;

  const factory ArtistsDataResult.failure(String message) = Failure;
}
