import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:montra/data/config/app_assets.dart';
import '../controllers/success_controller.dart';

class SuccessView extends GetView<SuccessController> {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AnimatedBuilder(
        animation: controller.animController,
        builder: (context, child) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: controller.widgetAnimation().value.h,
                width: controller.widgetAnimation().value.h,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppAssets.success),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              20.verticalSpace,
              Opacity(
                opacity: controller.textAnimation().value,
                child: const Text(
                  'You are all set!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
