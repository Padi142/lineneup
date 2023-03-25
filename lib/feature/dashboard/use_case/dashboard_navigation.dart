import '../../../generic/constant.dart';
import '../../../library/app_navigation.dart';

class DashboardNavigation {
  void goToLogin() {
    AppNavigation().push(ScreenPath.LOGIN_SCREEN, root: false);
  }

  void goToEventCreation() {
    AppNavigation().push(ScreenPath.EVENT_CREATION, root: false);
  }

  void goToDashboard() {
    AppNavigation().push(ScreenPath.DASHBOARD_SCREEN, root: true);
  }

  void goToEventDetail(String eventId) {
    AppNavigation().push(ScreenPath.DASHBOARD_EVENT_INFO, params: {'id': eventId});
  }
}
