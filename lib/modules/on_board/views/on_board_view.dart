import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:montra/data/config/app_colors.dart';
import 'package:montra/modules/on_board/controllers/on_board_controller.dart';
import 'package:montra/ui/widgets/app_button.dart';
import 'package:montra/ui/widgets/text_icon_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardView extends GetView<OnBoardController> {
  const OnBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Obx(
            () => Visibility(
              visible: !controller.isLastPage(),
              child: TextIconButton(
                onPressed: controller.onSkip,
                isTransparent: true,
                text: 'Skip',
                icon: CupertinoIcons.forward,
              ),
            ).paddingSymmetric(horizontal: 20.w),
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          10.verticalSpace,
          Expanded(
            child: PageView.builder(
              controller: controller.pageController,
              itemCount: controller.onBoardImages.length,
              onPageChanged: controller.onPageChanged,
              itemBuilder: (context, index) {
                return _buildPage(
                    controller.onBoardImages[index],
                    controller.onBoardTitle[index],
                    controller.onBoardSubtitle[index]);
              },
            ),
          ),
          20.verticalSpace,
          SmoothPageIndicator(
            controller: controller.pageController,
            count: controller.onBoardImages.length,
            effect: CustomizableEffect(
                activeDotDecoration: DotDecoration(
                    color: AppColors.k7F3DFF,
                    height: 15,
                    borderRadius: BorderRadius.circular(20)),
                dotDecoration: DotDecoration(
                    color: AppColors.kBlack26,
                    height: 8,
                    borderRadius: BorderRadius.circular(8))),
          ),
          40.verticalSpace,
          Obx(
            () => controller.isLastPage()
                ? _buildButtons()
                : IconButton.filledTonal(
                    onPressed: controller.onNextClick,
                    padding: REdgeInsets.all(20),
                    icon: const Icon(CupertinoIcons.arrow_right),
                  ),
          ),
          20.verticalSpace,
        ],
      ),
    );
  }

  Widget _buildPage(String imagePath, String title, String subTitle) {
    return Column(
      children: [
        Container(
          height: 321.h,
          width: 321.w,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              imagePath,
            ),
            fit: BoxFit.cover,
          )),
        ),
        20.verticalSpace,
        Text(
          title,
          style: TextStyle(
            fontSize: 32.sp,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        20.verticalSpace,
        Text(
          subTitle,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              color: AppColors.kBlack45),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AppButton(
          onPressed: controller.onSignUp,
          text: 'Sign Up',
          type: AppButtonWidthType.half,
          colorType: AppButtonColorType.primary,
        ),
        AppButton(
          onPressed: controller.onLogin,
          text: 'Login',
          type: AppButtonWidthType.half,
          colorType: AppButtonColorType.secondary,
        )
      ],
    );
  }
}
