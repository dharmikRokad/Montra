import 'package:get/get.dart';
import 'package:montra/modules/home/controllers/home_controller.dart';
import 'package:montra/modules/profile/controller/profile_controller.dart';
import 'package:montra/modules/transaction/controller/transaction_controller.dart';

class TabsController extends GetxController {
  RxInt currentIndex = 0.obs;

  onTabChange(int value) {
    currentIndex(value);
    switch (value) {
      case 0:
        Get.find<HomeController>();
        break;

      case 1:
        Get.find<TransactionController>();
        break;

      case 2:
        Get.find<ProfileController>();
        break;
    }
  }
}
