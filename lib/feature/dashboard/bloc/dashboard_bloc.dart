import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lineneup/generic/event/model/params/get_user_events_params.dart';

import '../../../generic/artist/model/params/upload_artist_photo_params.dart';
import '../../../generic/event/domain/get_user_events.dart';
import '../../../generic/user/use_case/get_current_session_use_case.dart';
import '../../../generic/user/use_case/get_current_user_use_case.dart';
import '../use_case/dashboard_navigation.dart';
import '../use_case/file_pick_use_case.dart';
import '../use_case/upload_file_use_case.dart';
import 'dashboard_state.dart';

part 'dashboard_event.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardNavigation dashboardNavigation;
  final GetCurrentUserUseCase getCurrentUserUseCase;
  final GetCurrentSessionUseCase getCurrentSessionUseCase;
  final GetUserEventsUseCase getUserEventsUseCase;
  final PickFileUseCase pickFileUseCase;
  final ArtistPhotoUploadUseCase artistPhotoUploadUseCase;

  DashboardBloc({
    required this.dashboardNavigation,
    required this.getCurrentUserUseCase,
    required this.getCurrentSessionUseCase,
    required this.getUserEventsUseCase,
    required this.pickFileUseCase,
    required this.artistPhotoUploadUseCase,
  }) : super(const DashboardState.loading()) {
    on<Initial>(_onInitEvent);
    on<EventCreation>(_onEventCreation);
    on<PickAndUploadFile>(_onPickAndUploadFile);
  }
  Future<void> _onInitEvent(
    Initial event,
    Emitter<DashboardState> emit,
  ) async {
    final user = await getCurrentUserUseCase.call();
    if (user == null) {
      dashboardNavigation.goToLogin();
      return;
    }
    final params = GetUserEventsParams(userUid: user.id);
    final response = await getUserEventsUseCase.call(params);

    response.map(loaded: (loaded) {
      emit(DashboardState.loaded(loaded.events));
    }, failure: (failure) {
      emit(const DashboardState.error('could not load your events'));
    });
  }

  Future<void> _onEventCreation(
    EventCreation event,
    Emitter<DashboardState> emit,
  ) async {
    dashboardNavigation.goToEventCreation();
  }

  Future<void> _onPickAndUploadFile(
    PickAndUploadFile event,
    Emitter<DashboardState> emit,
  ) async {
    final fileResult = await pickFileUseCase.call();
    if (fileResult != null) {
      final uploadParams = UploadArtistPhotoParams(uid: event.eventUid, file: fileResult);

      final uploadResult = await artistPhotoUploadUseCase.call(uploadParams);
      print(uploadResult);
    }
  }
}
