import 'package:montra/data/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppDropdown extends StatelessWidget {
  const AppDropdown({
    super.key,
    required this.name,
    required this.items,
    this.labelText,
    this.validator,
    this.onChanged,
    this.prefixIcon,
    this.prefixText,
    this.suffixIcon,
    this.onTap,
    this.enabled,
    this.disabledHint,
    this.hintText,
  });

  final String name;
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final String? prefixText;
  final Widget? suffixIcon;
  final String? disabledHint;
  final bool? enabled;
  final List<DropdownMenuItem<dynamic>> items;
  final String? Function(dynamic)? validator;
  final void Function(dynamic)? onChanged;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        SizedBox(
          width: 343.w,
          child: FormBuilderDropdown(
            name: name,
            items: items,
            validator: validator,
            enabled: enabled ?? true,
            disabledHint: Text(disabledHint ?? ''),
            onChanged: onChanged,
            onTap: onTap,
            isDense: true,
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              prefixText: prefixText,
              suffixIcon: suffixIcon,
              hintText:  hintText ?? '',
              contentPadding:
              EdgeInsets.symmetric(horizontal: 15.r, vertical: 15.r),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(
                  color: AppColors.k7F3DFF,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
          ),
        )
      ],
    ).paddingOnly(bottom: 20);
  }
}
