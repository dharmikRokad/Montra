import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:montra/utils/utils.dart';

extension ScreenUtilExtension on Widget {
  Widget addHideKeyboard() => GestureDetector(
        onTap: () {
          Utils.hideKeyboard();
        },
        child: this,
      );
}
