import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lineneup/generic/event/model/params/update_event_params.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:universal_io/io.dart';

import '../../../../generic/artist/data/create_artist_use_case.dart';
import '../../../../generic/artist/data/get_artists_use_case.dart';
import '../../../../generic/artist/model/params/create_artist_params.dart';
import '../../../../generic/artist/model/params/upload_event_cover_params.dart';
import '../../../../generic/event/domain/create_event_use_case.dart';
import '../../../../generic/event/domain/get_event_use_case.dart';
import '../../../../generic/event/domain/get_user_events.dart';
import '../../../../generic/event/domain/update_event_use_case.dart';
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
  final CreateArtistUseCase createArtistUseCase;
  final UploadArtistPhotoUseCase uploadArtistPhotoUseCase;
  final UploadEventCoverUseCase uploadEventCoverUseCase;
  final GetEventUseCase getEventUseCase;
  final GetArtistsUseCase getArtistsUseCase;
  final UpdateEventUseCase updateEventUseCase;

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
    required this.createArtistUseCase,
    required this.updateEventUseCase,
  }) : super(const EventState.loading()) {
    on<EventInitial>(_onInitEvent);
    on<UploadEventCover>(_onUploadEventCover);
    on<CreateEvent>(_onCreateEvent);
    on<LoadEventInfo>(_onLoadEventInfo);
    on<UpdateEvent>(_onUpdateEvent);
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

    final eventParams = CreateEventParams(eventName: event.eventName, creatorUid: user!.id, description: event.description, startDate: startDate, endDate: endDate);

    final eventResult = await createEventUseCase(eventParams);

    if (eventResult.error != null || eventResult.uid == null) {
      //TODO emit error
    }

    for (ArtistCreationModel artist in event.artists) {
      DateTime? artistStartTime;
      DateTime? artistEndTime;
      if (artist.startTime.hour < 8) {
        artistStartTime = event.startDate.add(const Duration(days: 1));
      } else {
        artistStartTime = event.startDate;
      }

      if (artist.endTime.hour < 8) {
        artistEndTime = event.startDate.add(const Duration(days: 1));
      } else {
        artistEndTime = event.startDate;
      }

      final artistParams = CreateArtistParams(
          artistName: artist.name,
          eventUid: eventResult.uid!,
          description: 'Artist',
          startTime: artistStartTime,
          endTime: artistEndTime,
          spotifyUrl: artist.spotifyUrl ?? '',
          instagramUrl: artist.instagramUrl ?? '',
          appleUrl: '',
          image: artist.spotifyImage ?? 'https://media.discordapp.net/attachments/1067446074945577031/1089327520756809808/336631773_538820211655657_2763088481672576367_n.png?width=802&height=754');

      final artistResult = await createArtistUseCase.call(artistParams);
      if (artistResult != 'ok') {
        //TODO emit error
      }
    }

    dashboardNavigation.goToDashboard();
  }

  Future<void> _onLoadEventInfo(
    LoadEventInfo event,
    Emitter<EventState> emit,
  ) async {
    emit(const EventState.loading());

    String? eventUid;
    if (event.eventId == null) {
      eventUid = QR.params['id'].toString();
    } else {
      eventUid = event.eventId;
    }

    if (eventUid == null) {
      emit(const EventState.error('error loading event'));
      return;
    }
    final params = GetEventParams(id: eventUid);

    final result = await getEventUseCase(params);

    result.map(loaded: (loaded) {
      emit(EventState.loadedEvent(loaded.event));
    }, failure: (failure) {
      emit(const EventState.error('Error loading event'));
    });
  }

  Future<void> _onUpdateEvent(
    UpdateEvent event,
    Emitter<EventState> emit,
  ) async {
    final type = EnumToString.convertToString(event.type);

    switch (event.type) {
      case UpdateType.description:
        {
          final params = UpdateEventParams(eventUid: event.eventId, type: type, description: event.description);
          final result = updateEventUseCase.call(params);

          break;
        }

      case UpdateType.eventName:
        {
          final params = UpdateEventParams(eventUid: event.eventId, type: type, eventName: event.name);
          final result = updateEventUseCase.call(params);

          break;
        }

      case UpdateType.startTime:
        break;
      case UpdateType.endTime:
        break;
      case UpdateType.eventInstagram:
        {
          final params = UpdateEventParams(eventUid: event.eventId, type: type, eventInstagram: event.eventInstagram);
          final result = updateEventUseCase.call(params);

          break;
        }
      case UpdateType.eventWebsite:
        {
          final params = UpdateEventParams(eventUid: event.eventId, type: type, eventWebsite: event.eventWebsite);
          final result = updateEventUseCase.call(params);

          break;
        }
      case UpdateType.ticketsUrl:
        {
          final params = UpdateEventParams(eventUid: event.eventId, type: type, ticketsUrl: event.ticketsUrl);
          final result = updateEventUseCase.call(params);

          break;
        }
    }

    Future.delayed(const Duration(milliseconds: 200)).then((value) => add(LoadEventInfo(eventId: event.eventId)));
  }
}
