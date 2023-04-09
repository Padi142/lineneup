import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lineneup/feature/dashboard/bloc/dashboard/dashboard_bloc.dart';
import 'package:lineneup/feature/dashboard/use_case/dashboard_navigation.dart';
import 'package:lineneup/feature/dashboard/use_case/file_pick_use_case.dart';
import 'package:lineneup/feature/dashboard/use_case/upload_event_cover_use_case.dart';
import 'package:lineneup/feature/dashboard/use_case/uploadt_artist_photo_use_case.dart';
import 'package:lineneup/feature/dashboard/view/dashboard_event_info_page.dart';
import 'package:lineneup/feature/dashboard/view/dashboard_screen.dart';
import 'package:lineneup/feature/dashboard/view/event_creation_page.dart';
import 'package:lineneup/generic/artist/data/create_artist_use_case.dart';
import 'package:lineneup/generic/event/domain/event_repository.dart';
import 'package:lineneup/generic/event/domain/get_user_events.dart';
import 'package:lineneup/generic/user/use_case/get_current_session_use_case.dart';
import 'package:lineneup/generic/user/use_case/get_current_user_use_case.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../generic/artist/data/get_artists_use_case.dart';
import '../../generic/artist/data/search_artist_use_case.dart';
import '../../generic/artist/domain/artist_repository.dart';
import '../../generic/event/domain/create_event_use_case.dart';
import '../../generic/event/domain/get_event_use_case.dart';
import '../../generic/event/domain/update_event_use_case.dart';
import '../../library/app_module.dart';
import 'bloc/artist/artist_bloc.dart';
import 'bloc/event/event_bloc.dart';

class DashboardModule extends AppModule {
  @override
  void registerNavigation() {
    GetIt.I.registerFactory<DashboardNavigation>(() => DashboardNavigation());
  }

  @override
  void registerBloc() {
    GetIt.I.registerFactory<DashboardBloc>(
      () => DashboardBloc(
        dashboardNavigation: GetIt.I.get<DashboardNavigation>(),
        getUserEventsUseCase: GetIt.I.get<GetUserEventsUseCase>(),
        getCurrentSessionUseCase: GetIt.I.get<GetCurrentSessionUseCase>(),
        getCurrentUserUseCase: GetIt.I.get<GetCurrentUserUseCase>(),
      ),
    );

    GetIt.I.registerFactory<EventBloc>(
      () => EventBloc(
        dashboardNavigation: GetIt.I.get<DashboardNavigation>(),
        getUserEventsUseCase: GetIt.I.get<GetUserEventsUseCase>(),
        getCurrentSessionUseCase: GetIt.I.get<GetCurrentSessionUseCase>(),
        getCurrentUserUseCase: GetIt.I.get<GetCurrentUserUseCase>(),
        pickFileUseCase: GetIt.I.get<PickFileUseCase>(),
        createEventUseCase: GetIt.I.get<CreateEventUseCase>(),
        uploadArtistPhotoUseCase: GetIt.I.get<UploadArtistPhotoUseCase>(),
        uploadEventCoverUseCase: GetIt.I.get<UploadEventCoverUseCase>(),
        getArtistsUseCase: GetIt.I.get<GetArtistsUseCase>(),
        getEventUseCase: GetIt.I.get<GetEventUseCase>(),
        createArtistUseCase: GetIt.I.get<CreateArtistUseCase>(),
        updateEventUseCase: GetIt.I.get<UpdateEventUseCase>(),
      ),
    );

    GetIt.I.registerFactory<ArtistBloc>(
      () => ArtistBloc(
        getArtistsUseCase: GetIt.I.get<GetArtistsUseCase>(),
        searchSpotifyArtistsUseCase: GetIt.I.get<SearchSpotifyArtistsUseCase>(),
      ),
    );
  }

  @override
  void registerScreen() {
    GetIt.I.registerFactory<DashboardScreen>(() => DashboardScreen());
    GetIt.I.registerFactory<DashboardEventInfo>(() => DashboardEventInfo());
    GetIt.I.registerFactory<EventCreationScreen>(() => EventCreationScreen());
  }

  @override
  void registerUseCase() {
    GetIt.I.registerFactory<UploadArtistPhotoUseCase>(
      () => UploadArtistPhotoUseCase(
        repository: GetIt.I.get<ArtistRepository>(),
      ),
    );
    GetIt.I.registerFactory<UploadEventCoverUseCase>(
      () => UploadEventCoverUseCase(
        repository: GetIt.I.get<EventRepository>(),
      ),
    );
    GetIt.I.registerFactory<PickFileUseCase>(
      () => PickFileUseCase(),
    );
  }

  @override
  void registerRoute(routes) {
    routes.add(
      QRoute(
          builder: () => MultiBlocProvider(
                providers: [
                  BlocProvider<DashboardBloc>.value(value: GetIt.I.get<DashboardBloc>()),
                  BlocProvider<ArtistBloc>.value(value: GetIt.I.get<ArtistBloc>()),
                  BlocProvider<EventBloc>(
                    create: (_) => GetIt.I.get<EventBloc>(),
                  ),
                ],
                child: GetIt.I.get<DashboardScreen>(),
              ),
          name: DashboardScreen.name,
          path: '/dashboard',
          children: [
            QRoute(
              builder: () => MultiBlocProvider(
                providers: [
                  BlocProvider<EventBloc>(
                    create: (_) => GetIt.I.get<EventBloc>(),
                  ),
                  BlocProvider<ArtistBloc>.value(value: GetIt.I.get<ArtistBloc>()),
                ],
                child: GetIt.I.get<EventCreationScreen>(),
              ),
              name: EventCreationScreen.name,
              path: '/create_event',
            ),
            QRoute(
              builder: () => MultiBlocProvider(
                providers: [
                  BlocProvider<DashboardBloc>.value(value: GetIt.I.get<DashboardBloc>()),
                  BlocProvider<ArtistBloc>.value(value: GetIt.I.get<ArtistBloc>()),
                  BlocProvider<EventBloc>(
                    create: (_) => GetIt.I.get<EventBloc>(),
                  ),
                ],
                child: GetIt.I.get<DashboardEventInfo>(),
              ),
              name: DashboardEventInfo.name,
              path: '/info/:id',
            )
          ]),
    );
  }
}
