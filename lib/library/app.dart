import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:qlevar_router/qlevar_router.dart';

import 'app_config.dart';
import 'app_module.dart';
import 'app_navigation.dart';
import 'app_theme.dart';

class App {
  factory App() => _instance;
  static App _instance = App._();
  factory App.newInstance() => _instance = App._();
  App._();

  static App get I => App();
  static App get instance => App();

  final List<String> _languages = [];
  String _language = 'en';
  static String get language => I._language;

  late AppTheme _appTheme;
  static AppTheme get appTheme => I._appTheme;
  late AppConfig _config;
  static AppConfig get config => I._config;

  final List<QRoute> _routes = [];
  static List<QRoute> get routes => I._routes;

  Future<void> set({
    String? language,
  }) async {
    if (language != null) {
      _language = language;
      AppNavigation().navigationKey.currentContext?.setLocale(Locale(language));
    }
  }

  Future<void> init({
    required AppConfig config,
    required List<AppModule> modules,
    Function()? registerDependencies,
  }) async {
    _config = config;
    _languages.addAll(config.languages);
    _appTheme = config.theme;

    GetIt.I.registerSingleton<Logger>(
      Logger(
        level: Level.debug,
        printer: PrettyPrinter(
          methodCount: 0,
          errorMethodCount: 0,
          lineLength: 200,
        ),
        // filter: ReleaseLogFilter(),
      ),
    );

    if (registerDependencies != null) {
      registerDependencies();
    }

    //register modules
    for (final module in modules) {
      module.registerDI();
      module.registerRepo();
      module.registerNavigation();
      module.registerUseCase();
      module.registerBloc();
      module.registerScreen();
      module.registerRoute(_routes);
    }
  }

  void run(Widget appWidget) {
    FlutterError.onError = (details) async {
      if (!kReleaseMode) {
        FlutterError.dumpErrorToConsole(details);
      } else if (details.stack != null) {
        Zone.current.handleUncaughtError(details.exception, details.stack!);
      }
    };

    runZonedGuarded<Future<void>>(() async {
      runApp(
        EasyLocalization(
          key: UniqueKey(),
          supportedLocales: _languages.map((lang) => Locale(lang)).toList(),
          path: 'assets/translations',
          fallbackLocale: const Locale('en'),
          child: appWidget,
        ),
      );
    }, (Object exception, StackTrace stackTrace) async {
      if (exception is Exception) {
        GetIt.I.get<Logger>().wtf('Zone level exception', exception, stackTrace);
      } else if (exception is Error) {
        GetIt.I.get<Logger>().wtf('Zone level error', exception, stackTrace);
      }
      GetIt.I.get<Logger>().e('Zone level error: $stackTrace', exception, stackTrace);
    });
  }
}
