import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lineneup/generic/event/model/event_model.dart';

part 'lineup_state.freezed.dart';

@freezed
abstract class LineupState with _$LineupState {
  const factory LineupState.loading() = Loading;
  const factory LineupState.error() = Error;
  const factory LineupState.loaded(EventModel event) = Loaded;
}
