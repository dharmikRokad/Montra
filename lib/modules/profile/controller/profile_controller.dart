import 'package:get/get.dart';
import '../../../data/config/logger.dart';
import '../../../data/providers/user_provider.dart';
import '../../../data/services/firebase/firebase_auth_service.dart';
import '../../../routes/app_routes.dart';

class ProfileController extends GetxController {
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
