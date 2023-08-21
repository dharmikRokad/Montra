import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:montra/data/config/app_colors.dart';
import 'package:montra/ui/widgets/app_button.dart';
import '../controller/set_account_controller.dart';

class SetAccountView extends GetView<SetAccountController> {
  const SetAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Let\'s setup your\naccount!',
            style: TextStyle(
              fontSize: 36.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          30.verticalSpace,
          Text(
            'Account can be your bank, credit card or\nyour wallet',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 20, vertical: 10),
      bottomNavigationBar: AppButton(
        onPressed: controller.onGoClick,
        text: 'Let\'s go',
        type: AppButtonWidthType.full,
        colorType: AppButtonColorType.primary,
      ).paddingAll(15.h),
    );
  }
}
