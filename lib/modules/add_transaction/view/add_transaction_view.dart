import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:montra/data/config/logger.dart';
import 'package:montra/ui/widgets/app_dropdown.dart';
import 'package:montra/ui/widgets/app_txt_field.dart';

import '../../../ui/widgets/add_details_view.dart';
import '../../../ui/widgets/app_button.dart';
import '../controller/add_transaction_controller.dart';

class AddTransactionView extends GetView<AddTransactionController> {
  const AddTransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    logE(controller.backColor);
    return Scaffold(
      backgroundColor: controller.backColor,
      appBar: AppBar(
        backgroundColor: controller.backColor,
        title: const Text('Add new Transaction'),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      bottomSheet: BottomSheet(
        onClosing: () {},
        backgroundColor: controller.backColor,
        enableDrag: false,
        builder: (BuildContext context) {
          return FormBuilder(
            key: controller.formKey,
            child: AddDetailsView(
              txtFieldLabel: 'Balance',
              amountController: controller.amountController,
              child: Container(),
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

// List<Widget> _buildForm() => [
//   AppDropdown(name: 'category', items: _buildCategories()),
// ];

// List<DropdownMenuItem<dynamic>> _buildCategories() =>
}
