import 'package:get/get.dart';

import '../controllers/add_profile_pic_controller.dart';

class AddProfilePicBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddProfilePicController());
  }
}
