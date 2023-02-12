import 'package:get_it/get_it.dart';
import 'package:lineneup/generic/api/artist_api.dart';
import 'package:lineneup/generic/artist/data/get_artists_use_case.dart';
import 'package:lineneup/generic/artist/domain/artist_repository.dart';

import '../../library/app.dart';
import '../../library/app_module.dart';
import 'data/artist_repository_impl.dart';

class ArtistModule extends AppModule {
  @override
  void registerDI() {
    GetIt.I
        .registerFactory<ArtistApi>(() => ArtistApi(dio(App.config.endpoint)));
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
  }
}
