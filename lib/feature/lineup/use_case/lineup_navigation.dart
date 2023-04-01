import '../../../generic/constant.dart';
import '../../../library/app_navigation.dart';

class LineupNavigation {
  void goToHome() {
    AppNavigation().push(ScreenPath.HOME_SCREEN, root: true);
  }
}
