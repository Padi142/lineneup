import 'dart:typed_data';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:lineneup/generic/event/model/params/get_user_events_params.dart';
import 'dart:io';
import 'package:universal_io/io.dart';

import '../../../generic/artist/model/params/upload_artist_photo_params.dart';
import '../../../generic/artist/model/params/upload_event_cover_params.dart';
import '../../../generic/event/domain/get_user_events.dart';
import '../../../generic/user/use_case/get_current_session_use_case.dart';
import '../../../generic/user/use_case/get_current_user_use_case.dart';
import '../use_case/dashboard_navigation.dart';
import '../use_case/file_pick_use_case.dart';
import '../use_case/upload_event_cover_use_case.dart';
import '../use_case/uploadt_artist_photo_use_case.dart';
import 'dashboard_state.dart';

part 'dashboard_event.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardNavigation dashboardNavigation;
  final GetCurrentUserUseCase getCurrentUserUseCase;
  final GetCurrentSessionUseCase getCurrentSessionUseCase;
  final GetUserEventsUseCase getUserEventsUseCase;
  final PickFileUseCase pickFileUseCase;
  final UploadArtistPhotoUseCase uploadArtistPhotoUseCase;
  final UploadEventCoverUseCase uploadEventCoverUseCase;

  DashboardBloc({
    required this.dashboardNavigation,
    required this.getCurrentUserUseCase,
    required this.getCurrentSessionUseCase,
    required this.getUserEventsUseCase,
    required this.pickFileUseCase,
    required this.uploadArtistPhotoUseCase,
    required this.uploadEventCoverUseCase,
  }) : super(const DashboardState.loading()) {
    on<Initial>(_onInitEvent);
    on<EventCreation>(_onEventCreation);
    on<UploadEventCover>(_onUploadEventCover);
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

  Future<void> _onUploadEventCover(
    UploadEventCover event,
    Emitter<DashboardState> emit,
  ) async {
    final fileResult = await pickFileUseCase.call();
    if (fileResult != null) {
      final bytes = await fileResult.readAsBytes();
      final file = File.fromRawPath(bytes);
      final multipartFile = await MultipartFile.fromFile(file.path);
      final uploadParams =
          UploadEventCoverParams(uid: event.eventUid, file: multipartFile);

      final uploadResult = await uploadEventCoverUseCase.call(uploadParams);
      print(uploadResult);
    }
  }
}
