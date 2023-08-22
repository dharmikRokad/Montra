import 'package:get/get.dart';
import 'package:montra/data/providers/user_provider.dart';
import 'package:montra/data/services/firebase/firebase_auth_service.dart';
import 'package:montra/routes/app_routes.dart';
import '../../../data/config/logger.dart';

class HomeController extends GetxController {
  RxBool isBtnLoading = false.obs;

  Future<void> onLogOut() async {
    isBtnLoading(true);
    try {
      await FireAuthService.signOutFromApp();
      await UserProvider.onLogout();
      Get.offAllNamed(Routes.logIn);
    } catch (e) {
      logE(e);
    } finally {
      isBtnLoading(false);
    }
  }
}
