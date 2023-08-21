import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:montra/data/config/app_colors.dart';
import 'package:montra/ui/widgets/app_txt_field.dart';

class AddDetailsView extends StatefulWidget {
  const AddDetailsView({
    super.key,
    required this.child,
    required this.amountController,
    this.txtFieldLabel,
    this.isLoading = false,
  });

  final Widget child;
  final TextEditingController amountController;
  final String? txtFieldLabel;
  final bool? isLoading;

  @override
  State<AddDetailsView> createState() => _AddDetailsViewState();
}

class _AddDetailsViewState extends State<AddDetailsView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppTextField(
            name: 'amount',
            labelText: widget.txtFieldLabel,
            prefixText: '\$ ',
            contentPadding: EdgeInsets.zero,
            controller: widget.amountController,
            border: InputBorder.none,
            keyboardType: TextInputType.number,
            validator: FormBuilderValidators.required(),
            labelStyle: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.kFCFCFC),
            style: TextStyle(
              fontSize: 64.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.kFFFFFF,
            ),
          ).paddingSymmetric(horizontal: 20.w),
          Container(
            padding: REdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(32.r),
              ),
              color: AppColors.kFFFFFF,
            ),
            child: widget.child,
          ),
        ],
      ),
    );
  }
}
