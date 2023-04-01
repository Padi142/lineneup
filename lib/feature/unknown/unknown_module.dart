import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lineneup/feature/unknown/view/unknown_screen.dart';

import '../../generic/constant.dart';
import '../../library/app_module.dart';

class UnknownModule extends AppModule {
  @override
  void registerScreen() {
    GetIt.I.registerFactory<UnknownScreen>(() => UnknownScreen());
  }

  @override
  void registerDI() {
    GetIt.I.registerFactory<Widget>(
      () => GetIt.I.get<UnknownScreen>(),
      instanceName: ScreenPath.UNKNOWN_SCREEN,
    );
  }
}
