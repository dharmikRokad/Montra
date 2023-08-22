import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:montra/data/config/app_colors.dart';
import 'package:montra/ui/widgets/app_button.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        backgroundColor: AppColors.k7F3DFF,
      ),
      body: Center(
        child: Obx(() => AppButton(
              onPressed: controller.onLogOut,
              text: 'Log out',
              type: AppButtonWidthType.half,
              colorType: AppButtonColorType.primary,
              isLoading: controller.isBtnLoading(),
            )),
      ),
    );
  }
}
