import '../../../generic/constant.dart';
import '../../../library/app_navigation.dart';

class HomeNavigation {
  void goToLogin() {
    AppNavigation().push(ScreenPath.LOGIN_SCREEN, root: false);
  }
}
