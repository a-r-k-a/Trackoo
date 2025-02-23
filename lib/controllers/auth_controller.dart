import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isLogin = false.obs;

  void onToggleView() {
    isLogin.value = !isLogin.value;
  }
}
