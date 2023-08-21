import 'package:get/get.dart';
import 'package:montra/modules/login/controllers/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }

}
