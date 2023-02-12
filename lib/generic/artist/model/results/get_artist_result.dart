import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lineneup/generic/artist/model/artist_model.dart';

part 'get_artist_result.freezed.dart';

@freezed
class ArtistDataResult with _$ArtistDataResult {
  const factory ArtistDataResult.loaded(
    List<ArtistModel> event,
  ) = Loaded;

  const factory ArtistDataResult.failure(String message) = Failure;
}
