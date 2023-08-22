import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:montra/data/config/logger.dart';
import 'package:montra/data/enums/account_type.dart';
import 'package:montra/data/helper/firestore/firestore_helper.dart';
import 'package:montra/data/models/account.dart';
import 'package:montra/routes/app_routes.dart';

class AddNewAccountController extends GetxController {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  TextEditingController amountController = TextEditingController();
  TextEditingController acNameController = TextEditingController();
  TextEditingController acTypeController = TextEditingController();

  RxList<String> acTypes = ['Bank', 'Wallet', 'Cash'].obs;
  RxString currentAcType = ''.obs;
  RxBool btnLoading = false.obs;

  Future<void> onContinue() async {
    btnLoading(true);
    try {
      await FirestoreHelper.addAccount(
        Account(
          acName: acNameController.text,
          acType: AccountType.fromString(currentAcType().toLowerCase()),
          balance: double.parse(amountController.text),
        ),
      );

      Get.offAllNamed(Routes.successScreen);
    } catch (e) {
      logI(e.toString());
    } finally {
      btnLoading(false);
    }
  }

  void onTypeChanged(dynamic value) {
    currentAcType(value.toString());
    logI(currentAcType());
  }
}
