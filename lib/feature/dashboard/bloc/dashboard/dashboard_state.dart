import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../generic/event/model/event_model.dart';

part 'dashboard_state.freezed.dart';

@freezed
abstract class DashboardState with _$DashboardState {
  const factory DashboardState.loading() = Loading;
  const factory DashboardState.error(String error) = Error;
  const factory DashboardState.loaded(List<EventModel> events) = Loaded;
}
