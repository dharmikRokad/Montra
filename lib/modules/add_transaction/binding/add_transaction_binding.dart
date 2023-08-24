import 'package:get/get.dart';

import '../controller/add_transaction_controller.dart';

class AddTransactionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddTransactionController());
  }
}
