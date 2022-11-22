import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lineneup/src/core/models/artist_model.dart';
import 'package:lineneup/src/core/models/lineup_model.dart';

part 'lineup_state.freezed.dart';

@freezed
class LineupState with _$LineupState {
  const factory LineupState.initial() = Initial;
  const factory LineupState.loaded(
      List<ArtistModel> upcommingArtists, ArtistModel currentArtist) = Loaded;
}
