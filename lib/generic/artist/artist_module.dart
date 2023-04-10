import 'package:get_it/get_it.dart';
import 'package:lineneup/generic/api/artist_api.dart';
import 'package:lineneup/generic/artist/domain/artist_repository.dart';

import '../../library/app.dart';
import '../../library/app_module.dart';
import 'data/artist_repository_impl.dart';
import 'domain/create_artist_use_case.dart';
import 'domain/get_artists_use_case.dart';
import 'domain/search_artist_use_case.dart';

class ArtistModule extends AppModule {
  @override
  void registerDI() {
    GetIt.I.registerFactory<ArtistApi>(() => ArtistApi(dio(App.config.endpoint)));
  }

  @override
  void registerRepo() {
    GetIt.I.registerFactory<ArtistRepository>(
      () => ArtistRepositoryImpl(
        artistApi: GetIt.I.get<ArtistApi>(),
      ),
    );
  }

  @override
  void registerUseCase() {
    GetIt.I.registerFactory<GetArtistsUseCase>(
      () => GetArtistsUseCase(
        repository: GetIt.I.get<ArtistRepository>(),
      ),
    );

    GetIt.I.registerFactory<CreateArtistUseCase>(
      () => CreateArtistUseCase(
        repository: GetIt.I.get<ArtistRepository>(),
      ),
    );

    GetIt.I.registerFactory<SearchSpotifyArtistsUseCase>(
      () => SearchSpotifyArtistsUseCase(
        repository: GetIt.I.get<ArtistRepository>(),
      ),
    );
  }
}
