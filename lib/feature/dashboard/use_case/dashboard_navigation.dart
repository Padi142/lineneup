import '../../../generic/constant.dart';
import '../../../library/app_navigation.dart';

class DashboardNavigation {
  void goToLogin() {
    AppNavigation().push(ScreenPath.LOGIN_SCREEN, root: false);
  }

  void goToEventCreation() {
    AppNavigation().push(ScreenPath.EVENT_CREATION, root: false);
  }
}
