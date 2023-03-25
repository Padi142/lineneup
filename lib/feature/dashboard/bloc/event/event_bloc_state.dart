import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lineneup/generic/event/model/event_model.dart';

part 'event_bloc_state.freezed.dart';

@freezed
abstract class EventState with _$EventState {
  const factory EventState.loading() = Loading;
  const factory EventState.error(String error) = Error;
  const factory EventState.success() = Success;
  const factory EventState.loadedEvent(EventModel event) = LoadedEvent;
}
