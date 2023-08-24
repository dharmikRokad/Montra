import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../ui/widgets/app_button.dart';
import '../controller/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(
            () => AppButton(
              onPressed: controller.onLogOut,
              text: 'Log out',
              type: AppButtonWidthType.half,
              colorType: AppButtonColorType.primary,
              isLoading: controller.isBtnLoading(),
            ),
          )
        ],
      ),
    );
  }
}
