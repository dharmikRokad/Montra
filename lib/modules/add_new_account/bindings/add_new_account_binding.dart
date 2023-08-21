import 'package:get/get.dart';

import '../controller/add_new_account_controller.dart';

class AddNewAccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddNewAccountController());
  }
}
