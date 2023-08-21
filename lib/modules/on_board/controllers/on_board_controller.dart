import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:montra/data/config/app_assets.dart';
import 'package:montra/routes/app_routes.dart';

class OnBoardController extends GetxController
    with GetSingleTickerProviderStateMixin {
  PageController pageController = PageController();
  RxDouble progressValue = 0.33.obs;
  RxInt currentPage = 0.obs;
  RxBool isLastPage = false.obs;

  List<String> onBoardImages = [
    AppAssets.onBoard1,
    AppAssets.onBoard2,
    AppAssets.onBoard3
  ];

  List<String> onBoardTitle = [
    'Gain total control\nof your money',
    'Know where your\nmoney goes',
    'Planning ahead'
  ];

  List<String> onBoardSubtitle = [
    'Become your own money manager\nand make every cent count',
    'Track your transactions easily,\nwith categories and financial reports',
    'Setup your budget for each category\nso you in control'
  ];

  void onNextClick() {
    pageController.nextPage(
        duration: 500.milliseconds, curve: Curves.easeOut);
  }

  void onSkip() {
    pageController.animateToPage(
      onBoardImages.length - 1,
      duration: 500.milliseconds,
      curve: Curves.easeOut,
    );
  }

  void onPageChanged(int page) {
    currentPage(page);
    isLastPage(currentPage() == onBoardImages.length - 1);
    progressValue((page + 1) / onBoardImages.length);
  }

  void onSignUp() {
    Get.toNamed(Routes.signUp);
  }

  void onLogin() {
    Get.toNamed(Routes.logIn);
  }
}
