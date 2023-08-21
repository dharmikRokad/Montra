import 'package:get/get.dart';
import 'package:montra/modules/tabs/controller/tab_controller.dart';

class TabBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TabController());
  }
}
