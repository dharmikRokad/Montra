import 'package:get/get.dart';
import 'package:montra/modules/home/controllers/home_controller.dart';
import 'package:montra/modules/profile/controller/profile_controller.dart';
import 'package:montra/modules/tabs/controller/tab_controller.dart';
import 'package:montra/modules/transaction/controller/transaction_controller.dart';

class TabsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TabsController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => TransactionController());
    Get.lazyPut(() => ProfileController());
  }
}
