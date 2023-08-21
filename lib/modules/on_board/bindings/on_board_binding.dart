import 'package:get/get.dart';
import 'package:montra/modules/on_board/controllers/on_board_controller.dart';

class OnBoardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnBoardController());
  }

}
