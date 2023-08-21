import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:montra/data/config/app_colors.dart';

class TextIconButton extends StatelessWidget {
  const TextIconButton({
    super.key,
    required this.onPressed,
    required this.isTransparent,
    required this.text,
    required this.icon,
  });

  final VoidCallback onPressed;
  final bool isTransparent;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextButton.icon(
        onPressed: onPressed,
        style: isTransparent
            ? ElevatedButton.styleFrom(
                backgroundColor: AppColors.kFFFFFF,
                elevation: 0,
              )
            : ElevatedButton.styleFrom(),
        label: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
        icon: Icon(
          icon,
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}
