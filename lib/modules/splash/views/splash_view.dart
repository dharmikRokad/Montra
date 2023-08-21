import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:montra/data/config/app_colors.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.animController,
      builder: (context, child) => Scaffold(
        backgroundColor: AppColors.k7F3DFF,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              right: controller.containerPositionAnimation().value.w,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                        colors: const [
                          AppColors.kE040FB,
                          AppColors.kE040FB,
                          AppColors.k7F3DFF
                        ],
                        tileMode: TileMode.decal,
                        radius: 0.5.r,
                        focalRadius: 0.5.r,
                        center: Alignment.center,
                        stops: [0, 0.3, 0.9]
                        // focal: Alignment.bottomRight,
                        ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: controller.titlePositionAnimation().value.w,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Montra',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: AppColors.kFFFFFF,
                    fontWeight: FontWeight.w600,
                    fontSize: 70.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
