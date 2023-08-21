import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:montra/routes/app_routes.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animController;
  late Rx<Animation<double>> titleAnimation;
  late Rx<Animation<double>> titlePositionAnimation;
  late Rx<Animation<double>> containerRadiusAnimation;
  late Rx<Animation<double>> containerPositionAnimation;

  @override
  void onInit() async {
    animController = AnimationController(
      vsync: this,
      duration: 1.seconds,
    );

    // Title Animation
    titleAnimation = Tween<double>(begin: 0, end: 70)
        .animate(
          CurvedAnimation(
            parent: animController,
            curve: Curves.easeInOut,
          ),
        )
        .obs;

    // Title Position Animation
    titlePositionAnimation = Tween<double>(
      begin: 0,
      end: 1.sw * 0.20,
    )
        .animate(
          CurvedAnimation(
            parent: animController,
            curve: const Interval(0, 0.6, curve: Curves.easeInOut),
          ),
        )
        .obs;

    // Container Radius Animation
    containerRadiusAnimation = Tween<double>(begin: 0, end: 80)
        .animate(
          CurvedAnimation(
            parent: animController,
            curve: Curves.easeInOut,
          ),
        )
        .obs;

    // Container Color Animation (Radial Gradient)
    containerPositionAnimation = Tween<double>(
      begin: 0,
      end: 1.sw * 0.425,
    )
        .animate(
          CurvedAnimation(
            parent: animController,
            curve: Curves.easeInOut,
          ),
        )
        .obs;

    Future.delayed(2.seconds, () {
      Get.offNamed(Routes.onBoard);
    });

    animController.forward();

    super.onInit();
  }
}
