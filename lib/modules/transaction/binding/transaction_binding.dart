import 'package:get/get.dart';

import '../controller/transaction_controller.dart';

class TransactionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransactionController());
  }
}
