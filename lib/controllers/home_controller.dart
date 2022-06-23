import 'package:get/state_manager.dart';

class GetxHomeController extends GetxController {
  RxString city = "".obs;
  RxString state = "".obs;
  String address = "";

  void changeName(String city, String state) {
    this.city = city.obs;
    this.state = state.obs;
    update();
  }
}
