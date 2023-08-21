import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:montra/data/config/app_colors.dart';

enum AppButtonWidthType { full, half }

enum AppButtonColorType { primary, secondary }

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.foregroundColor,
    this.type,
    this.colorType,
    this.isLoading = false,
    this.elevation,
    this.radius = 16,
    this.icon,
  });

  final VoidCallback onPressed;
  final String text;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final AppButtonWidthType? type;
  final AppButtonColorType? colorType;
  final bool? isLoading;
  final double? radius;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ??
              (colorType == AppButtonColorType.primary
                  ? AppColors.k7F3DFF
                  : AppColors.kFFFFFF),
          foregroundColor: foregroundColor ??
              (colorType == AppButtonColorType.primary
                  ? AppColors.kFFFFFF
                  : AppColors.k7F3DFF),
          fixedSize: type == AppButtonWidthType.full
              ? Size(343.w, 56.h)
              : Size(164.w, 56.h),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 16.r))),
      icon: isLoading ?? false ? Container() : icon ?? Container(),
      label: isLoading ?? false
          ? SizedBox(
              height: 25.h,
              width: 25.w,
              child: CircularProgressIndicator(
                strokeWidth: 3.r,
                color: foregroundColor ??
                    (colorType == AppButtonColorType.primary
                        ? AppColors.kFFFFFF
                        : AppColors.k7F3DFF),
              ),
            )
          : Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
    );
  }
}
