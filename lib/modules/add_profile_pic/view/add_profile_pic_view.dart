import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:montra/data/config/app_colors.dart';
import 'package:montra/ui/widgets/app_button.dart';

import '../../../ui/widgets/text_icon_button.dart';
import '../controllers/add_profile_pic_controller.dart';

class AddProfilePicView extends GetView<AddProfilePicController> {
  const AddProfilePicView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextIconButton(
            onPressed: controller.onSkip,
            isTransparent: true,
            text: 'Skip',
            icon: CupertinoIcons.forward,
          ).paddingSymmetric(horizontal: 20.w),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Set your profile\npicture',
            style: TextStyle(
              fontSize: 36.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: controller.onImgTap,
              child: CircleAvatar(
                radius: 150.r,
                child: Obx(
                  () => Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: const Border.fromBorderSide(
                        BorderSide(color: AppColors.k000000),
                      ),
                      image: controller.imgPath().isNotEmpty
                          ? DecorationImage(
                              image: FileImage(File(controller.imgPath())),
                              fit: BoxFit.fitWidth,
                            )
                          : const DecorationImage(
                              image: NetworkImage(
                                  'https://cdn-icons-png.flaticon.com/128/149/149071.png'),
                              fit: BoxFit.fitWidth),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ).paddingSymmetric(horizontal: 20.w),
      bottomNavigationBar: BottomAppBar(
        child: Obx(
          () => AppButton(
            onPressed: controller.onContinue,
            text: 'Continue',
            isLoading: controller.isBtnLoading(),
            type: AppButtonWidthType.full,
            colorType: AppButtonColorType.primary,
          ),
        ),
      ),
    );
  }
}
