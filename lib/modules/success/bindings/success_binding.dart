import 'package:get/get.dart';
import '../controllers/success_controller.dart';

class SuccessBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SuccessController());
  }
}
