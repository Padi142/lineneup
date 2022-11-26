import 'package:qlevar_router/qlevar_router.dart';

class AppNavigation {
  void push(
    String path, {
    bool root = false,
    Map<String, dynamic>? params,
  }) {
    if (root) {
      QR.navigator.replaceAllWithName(path, params: params);
      return;
    }

    QR.navigator.pushName(path, params: params);
  }
}
