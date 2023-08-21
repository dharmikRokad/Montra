import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:montra/data/config/app_colors.dart';

class HyperLinkText extends StatelessWidget {
  const HyperLinkText({
    super.key,
    required this.text,
    required this.linkedText,
    required this.onPressed,
    this.textColor,
    this.linkColor,
  });

  final String text;
  final String linkedText;
  final VoidCallback onPressed;
  final Color? textColor;
  final Color? linkColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: textColor ?? AppColors.kBlack54,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: REdgeInsets.all(5),
            foregroundColor: linkColor ?? AppColors.k7F3DFF,
          ),
          child: Text(
            linkedText,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
