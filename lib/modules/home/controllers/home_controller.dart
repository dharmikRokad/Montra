import 'package:get/get.dart';
import 'package:montra/data/config/logger.dart';
import 'package:montra/data/enums/transaction_type.dart';
import 'package:montra/routes/app_routes.dart';

class HomeController extends GetxController {
  onExpenseClick() {
    logI('onExpenseClick');
    Get.toNamed(Routes.addTransaction, arguments: TransactionType.expense);
  }

  onIncomeClick() {
    logI('onIncomeClick');
    Get.toNamed(Routes.addTransaction, arguments: TransactionType.income);
  }

  onTransferClick() {
    logI('onTransferClick');
    Get.toNamed(Routes.addTransaction, arguments: TransactionType.transfer);
  }
}
