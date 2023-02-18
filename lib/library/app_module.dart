import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:qlevar_router/qlevar_router.dart';

import 'app.dart';

abstract class AppModule {
  void registerRepo() {}
  void registerUseCase() {}
  void registerBloc() {}
  void registerScreen() {}
  void registerNavigation() {}
  void registerRoute(List<QRoute> routes) {}
  void registerDI() {}

  void registerDependencies() {
    registerRepo();
    registerNavigation();
    registerUseCase();
    registerBloc();
    registerScreen();
    registerRoute(App.routes);
    registerDI();
  }

  Dio dio(String endpoint) {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: endpoint,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        contentType: 'application/json',
      ),
    );

    dio.interceptors.add(PrettyDioLogger());
    dio.interceptors.add(StaticHeaders());
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          String message = 'error__general';
          final Map<String, dynamic> responseMap =
              error.response?.data as Map<String, dynamic>? ??
                  <String, dynamic>{};
          if (responseMap.containsKey('error')) {
            message = responseMap['error'].toString();
          }
          return handler.next(
            DioError(
              requestOptions: error.requestOptions,
              error: message,
            ),
          );
        },
      ),
    );

    return dio;
  }
}

class StaticHeaders extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.contentType = Headers.jsonContentType;
    return super.onRequest(options, handler);
  }
}
