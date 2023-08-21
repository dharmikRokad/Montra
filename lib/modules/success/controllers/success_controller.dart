import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:montra/routes/app_routes.dart';

class SuccessController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animController;
  late Rx<Animation<double>> widgetAnimation;
  late Rx<Animation<double>> textAnimation;

  @override
  void onInit() async {
    animController = AnimationController(vsync: this, duration: 2.seconds);

    widgetAnimation = Tween<double>(
      begin: 0.r,
      end: 128.r,
    )
        .animate(
          CurvedAnimation(
            parent: animController,
            curve: const Interval(0, 0.5, curve: Curves.bounceInOut),
          ),
        )
        .obs;

    textAnimation = Tween<double>(
      begin: 0.r,
      end: 1.r,
    )
        .animate(
          CurvedAnimation(
            parent: animController,
            curve: const Interval(0.5, 1, curve: Curves.easeIn),
          ),
        )
        .obs;

    animController.forward();

    super.onInit();

    await Future.delayed(2.5.seconds).then(
      (value) => Get.offAllNamed(Routes.home),
    );
  }
}
