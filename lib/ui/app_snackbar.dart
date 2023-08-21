import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:montra/data/config/app_colors.dart';

enum SnackType { success, warning, error }

SnackbarController showSnack(String message, SnackType type) {
  Color backColor = type == SnackType.success
      ? AppColors.k7F3DFF
      : type == SnackType.warning
          ? Colors.orange
          : Colors.red;
  IconData icon = type == SnackType.success
      ? CupertinoIcons.check_mark_circled_solid
      : type == SnackType.warning
          ? CupertinoIcons.bell_fill
          : CupertinoIcons.exclamationmark_circle_fill;

  String title = type == SnackType.success
      ? 'Success'
      : type == SnackType.warning
          ? 'Warning'
          : 'Error';

  return Get.snackbar(
    title,
    message,
    margin: REdgeInsets.all(10),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: backColor,
    icon: Icon(icon),
  );
}
