import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:universal_io/io.dart';

import '../../../../generic/artist/data/get_artists_use_case.dart';
import '../../../../generic/artist/model/params/upload_event_cover_params.dart';
import '../../../../generic/event/domain/create_event_use_case.dart';
import '../../../../generic/event/domain/get_event_use_case.dart';
import '../../../../generic/event/domain/get_user_events.dart';
import '../../../../generic/event/model/params/create_event_params.dart';
import '../../../../generic/event/model/params/get_event_params.dart';
import '../../../../generic/user/use_case/get_current_session_use_case.dart';
import '../../../../generic/user/use_case/get_current_user_use_case.dart';
import '../../model/artist_creation_model.dart';
import '../../use_case/dashboard_navigation.dart';
import '../../use_case/file_pick_use_case.dart';
import '../../use_case/upload_event_cover_use_case.dart';
import '../../use_case/uploadt_artist_photo_use_case.dart';
import 'event_bloc_state.dart';

part 'event_bloc_event.dart';

class EventBloc extends Bloc<EventBlocEvent, EventState> {
  final DashboardNavigation dashboardNavigation;
  final GetCurrentUserUseCase getCurrentUserUseCase;
  final GetCurrentSessionUseCase getCurrentSessionUseCase;
  final GetUserEventsUseCase getUserEventsUseCase;
  final PickFileUseCase pickFileUseCase;
  final CreateEventUseCase createEventUseCase;
  final UploadArtistPhotoUseCase uploadArtistPhotoUseCase;
  final UploadEventCoverUseCase uploadEventCoverUseCase;
  final GetEventUseCase getEventUseCase;
  final GetArtistsUseCase getArtistsUseCase;

  EventBloc({
    required this.dashboardNavigation,
    required this.getCurrentUserUseCase,
    required this.getCurrentSessionUseCase,
    required this.getUserEventsUseCase,
    required this.pickFileUseCase,
    required this.createEventUseCase,
    required this.uploadArtistPhotoUseCase,
    required this.uploadEventCoverUseCase,
    required this.getEventUseCase,
    required this.getArtistsUseCase,
  }) : super(const EventState.loading()) {
    on<EventInitial>(_onInitEvent);
    on<UploadEventCover>(_onUploadEventCover);
    on<CreateEvent>(_onCreateEvent);
    on<LoadEventInfo>(_onLoadEventInfo);
  }
  Future<void> _onInitEvent(
    EventInitial event,
    Emitter<EventState> emit,
  ) async {}

  Future<void> _onUploadEventCover(
    UploadEventCover event,
    Emitter<EventState> emit,
  ) async {
    final fileResult = await pickFileUseCase.call();
    if (fileResult != null) {
      final bytes = await fileResult.readAsBytes();
      final file = File.fromRawPath(bytes);
      final multipartFile = await MultipartFile.fromFile(file.path);
      final uploadParams = UploadEventCoverParams(uid: event.eventUid, file: multipartFile);

      final uploadResult = await uploadEventCoverUseCase.call(uploadParams);
      print(uploadResult);
    }
  }

  Future<void> _onCreateEvent(
    CreateEvent event,
    Emitter<EventState> emit,
  ) async {
    DateTime startDate = event.startDate.copyWith(hour: event.startTime.hour, minute: event.startTime.minute);
    DateTime endDate = event.endDate.copyWith(hour: event.endTime.hour, minute: event.endTime.minute);

    final user = await getCurrentUserUseCase.call();

    if (user == null) {
      //TODO emit error
    }

    final params = CreateEventParams(eventName: event.eventName, creatorUid: user!.id, description: event.description, startDate: startDate, endDate: endDate);

    final result = await createEventUseCase(params);

    if (result != 'JO') {
      //TODO emit error
    }

    dashboardNavigation.goToDashboard();
  }

  Future<void> _onLoadEventInfo(
    LoadEventInfo event,
    Emitter<EventState> emit,
  ) async {
    final eventUid = QR.params['id'];

    if (eventUid == null) {
      emit(const EventState.error('error loading event'));
    }
    final params = GetEventParams(id: eventUid.toString());

    final result = await getEventUseCase(params);

    result.map(loaded: (loaded) {
      emit(EventState.loadedEvent(loaded.event));
    }, failure: (failure) {
      emit(const EventState.error('Error loading event'));
    });
  }
}
