import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lineneup/src/shared/models/event_model.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = Initial;
  const factory UserState.loaded(List<EventModel> events) = Loaded;
  const factory UserState.failed() = Failed;
}
