import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:lineneup/feature/dashboard/dashboard_module.dart';
import 'package:lineneup/feature/home/home_module.dart';
import 'package:lineneup/feature/init/init_module.dart';
import 'package:lineneup/feature/lineup/lineup_module.dart';
import 'package:lineneup/generic/artist/artist_module.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'feature/login/login_module.dart';
import 'feature/unknown/view/unknown_screen.dart';
import 'generic/event/event_module.dart';
import 'generic/locale/locale_resource.dart';
import 'generic/user/user_module.dart';
import 'library/app.dart';
import 'library/app_config.dart';
import 'library/app_module.dart';
import 'library/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Supabase.initialize(
    url: const String.fromEnvironment('SUPABASE_URL'),
    anonKey: const String.fromEnvironment('SUPABASE_SECRET'),
    authCallbackUrlHostname: 'login-callback', // optional
  );

  final AppConfig config = appConfig();

  GetIt.I.allowReassignment = true;

  App.instance.init(
    config: config,
    modules: modules(),
    registerDependencies: () {
      GetIt.I.registerFactory<LocaleResource>(
        () => LocaleResource(appConfig: config),
      );
    },
  );

  assert(config.languages.isNotEmpty);

  App.instance.run(const MainWidget());
}

AppConfig appConfig() {
  return AppConfig(
    endpoint: 'https://lineapbackend-production.up.railway.app/',
    languages: ['en'],
    theme: MainTheme(),
  );
}

List<AppModule> modules() {
  return [
    InitModule(),
    LineupModule(),
    EventModule(),
    UserModule(),
    ArtistModule(),
    HomeModule(),
    DashboardModule(),
    LoginModule(),
  ];
}

class MainTheme extends AppTheme {
  @override
  String get appFont => 'Poppins';

  @override
  Brightness get brightness => Brightness.dark;

  @override
  Color get colorPrimary => const Color(0xFFEC4899);

  @override
  Color get colorSecondary => const Color(0xff6366F1);

  @override
  Color get colorBlack => const Color(0xFF000000);

  @override
  Color get colorBackground1 => const Color(0xFF151133);

  @override
  Color get colorBackground2 => const Color(0xFF302B63);

  @override
  Color get colorBackground3 => const Color(0xFF24243E);

  @override
  Color get colorText => const Color(0xFFFFFFFF);

  @override
  Color get colorTextSecondary => const Color(0xff909090);

  @override
  Color get colorIcon => const Color(0xff344C73);

  @override
  Color get colorInactive => const Color(0xff2B2B2B);

  @override
  Color get colorNavbar => const Color(0xFFAFAFAF);

  @override
  Color get colorActive => const Color(0xFFda5b34);

  @override
  Color get colorError => const Color(0xFFFF5252);

  @override
  Color get colorWarning => const Color(0xFFFFD200);

  @override
  Color get colorSuccess => const Color(0xFF009A38);
}

class MainWidget extends StatelessWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),
    );

    QR.settings.notFoundPage = QRoute(
      path: '/404',
      builder: () => UnknownScreen(),
    );

    return MaterialApp.router(
      routeInformationParser: const QRouteInformationParser(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: App.appTheme.themeData,
      routerDelegate: QRouterDelegate(App.routes, initPath: '/landing'),
    );
  }
}
