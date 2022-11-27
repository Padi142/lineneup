import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lineneup/src/shared/models/artist_model.dart';

part 'event_state.freezed.dart';

@freezed
class EventState with _$EventState {
  const factory EventState.initial() = Initial;
  const factory EventState.error() = Error;
  const factory EventState.created() = Created;
  const factory EventState.updated() = Updated;
}
