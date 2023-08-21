import 'package:get/get.dart';
import '../controller/set_account_controller.dart';

class SetAccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SetAccountController());
  }
}
