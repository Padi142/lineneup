import 'package:get_it/get_it.dart';
import 'package:lineneup/generic/user/use_case/get_current_session_use_case.dart';
import 'package:lineneup/generic/user/use_case/get_current_user_use_case.dart';

import '../../library/app_module.dart';

class UserModule extends AppModule {
  @override
  void registerUseCase() {
    GetIt.I.registerFactory<GetCurrentUserUseCase>(
      () => GetCurrentUserUseCase(),
    );
    GetIt.I.registerFactory<GetCurrentSessionUseCase>(
      () => GetCurrentSessionUseCase(),
    );
  }
}
