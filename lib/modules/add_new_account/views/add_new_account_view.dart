import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:montra/data/config/app_colors.dart';
import 'package:montra/ui/widgets/add_details_view.dart';
import 'package:montra/ui/widgets/app_dropdown.dart';
import 'package:montra/ui/widgets/app_txt_field.dart';
import '../../../ui/widgets/app_button.dart';
import '../controller/add_new_account_controller.dart';

class AddNewAccountView extends GetView<AddNewAccountController> {
  const AddNewAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.k7F3DFF,
      appBar: AppBar(
        backgroundColor: AppColors.k7F3DFF,
        title: const Text('Add new account'),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      bottomSheet: BottomSheet(
        onClosing: () {},
        backgroundColor: AppColors.k7F3DFF,
        enableDrag: false,
        builder: (BuildContext context) {
          return FormBuilder(
            key: controller.formKey,
            child: AddDetailsView(
              txtFieldLabel: 'Balance',
              amountController: controller.amountController,
              child: _buildFormView(),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Obx(
          () => AppButton(
            onPressed: controller.onContinue,
            isLoading: controller.btnLoading(),
            text: 'Continue',
            type: AppButtonWidthType.full,
            colorType: AppButtonColorType.primary,
          ),
        ),
      ),
    );
  }

  Widget _buildFormView() => Column(
    children: [
      AppTextField(
        name: 'acName',
        hintText: 'Name',
        controller: controller.acNameController,
        validator: FormBuilderValidators.required(),
      ),
      AppDropdown(
        name: 'acType',
        hintText: 'Account type',
        items: _buildDropDownItems(),
        onChanged: controller.onTypeChanged,
        disabledHint: 'Account type',
        validator: FormBuilderValidators.required(),
      ),
    ],
  );

  List<DropdownMenuItem> _buildDropDownItems() => controller
      .acTypes()
      .map(
        (element) => DropdownMenuItem(
          value: element,
          child: Text(element),
        ),
      )
      .toList();
}
