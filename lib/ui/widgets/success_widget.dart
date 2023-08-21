import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:montra/data/config/app_assets.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({super.key, this.msg});

  final String? msg;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 128.h,
          width: 128.w,
          child: Image.asset(
            AppAssets.success,
            fit: BoxFit.fill,
          ),
        ),
        5.verticalSpace,
        Text(
          msg ?? 'You are set!',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
          ),
        )
      ],
    );
  }
}
