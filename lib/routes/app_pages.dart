import 'package:get/get.dart';
import 'package:montra/modules/add_new_account/bindings/add_new_account_binding.dart';
import 'package:montra/modules/add_new_account/views/add_new_account_view.dart';
import 'package:montra/modules/add_profile_pic/bindings/add_profile_pic_binding.dart';
import 'package:montra/modules/add_profile_pic/view/adD_profile_pic_view.dart';
import 'package:montra/modules/home/bindings/home_binding.dart';
import 'package:montra/modules/home/view/home_view.dart';
import 'package:montra/modules/login/bindings/login_binding.dart';
import 'package:montra/modules/login/views/login_view.dart';
import 'package:montra/modules/on_board/bindings/on_board_binding.dart';
import 'package:montra/modules/on_board/views/on_board_view.dart';
import 'package:montra/modules/set_account/bindings/set_account_binding.dart';
import 'package:montra/modules/sign_up/bindings/sign_up_binding.dart';
import 'package:montra/modules/sign_up/views/sign_up_view.dart';
import 'package:montra/modules/splash/bindings/splash_binding.dart';
import 'package:montra/modules/splash/views/splash_view.dart';
import 'package:montra/modules/success/bindings/success_binding.dart';
import 'package:montra/modules/success/view/success_view.dart';
import 'package:montra/modules/tabs/bindings/tab_binding.dart';
import 'package:montra/modules/tabs/view/tab_view.dart';
import 'package:montra/routes/app_routes.dart';

import '../modules/set_account/views/set_account_view.dart';

class AppPages {
  static List<GetPage> getPages() => <GetPage>[
        GetPage(
          name: Routes.splash,
          page: () => const SplashView(),
          binding: SplashBinding(),
        ),
        GetPage(
          name: Routes.onBoard,
          page: () => const OnBoardView(),
          binding: OnBoardBinding(),
        ),
        GetPage(
          name: Routes.logIn,
          page: () => const LoginView(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: Routes.signUp,
          page: () => const SignUpView(),
          binding: SignUpBinding(),
        ),
        GetPage(
          name: Routes.tab,
          page: () => const TabView(),
          binding: TabBinding(),
        ),
        GetPage(
          name: Routes.setupAccount,
          page: () => const SetAccountView(),
          binding: SetAccountBinding(),
        ),
        GetPage(
          name: Routes.addNewAccount,
          page: () => const AddNewAccountView(),
          binding: AddNewAccountBinding(),
        ),
        GetPage(
          name: Routes.successScreen,
          page: () => const SuccessView(),
          binding: SuccessBinding(),
        ),
        GetPage(
          name: Routes.addProfilePic,
          page: () => const AddProfilePicView(),
          binding: AddProfilePicBinding(),
        ),
        GetPage(
          name: Routes.home,
          page: () => const HomeView(),
          binding: HomeBinding(),
        ),
      ];
}
