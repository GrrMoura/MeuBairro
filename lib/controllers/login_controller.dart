import 'package:get/state_manager.dart';

class GetxLoginController extends GetxController {
  bool showPassword = true;

  bool remember = false;

  void showPass() {
    showPassword = !showPassword;

    update();
  }

  void rememberMe() {
    remember = !remember;

    update();
  }
}
