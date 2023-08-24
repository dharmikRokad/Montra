import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:montra/data/config/app_colors.dart';
import 'package:montra/data/enums/transaction_type.dart';
import 'package:montra/data/helper/firestore/firestore_helper.dart';

class AddTransactionController extends GetxController {
  late final TransactionType transactionType;

  late final Color backColor = Colors.red;

  TextEditingController amountController = TextEditingController();
  RxBool btnLoading = false.obs;
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  RxList<String> categories = <String>[].obs;

  @override
  void onInit() async {
    await configurePage();
    super.onInit();
  }

  Future<void> configurePage() async {
    if (Get.arguments is TransactionType) {
      transactionType = Get.arguments;
    }

    transactionType == TransactionType.expense
        ? AppColors.kFD3C4A
        : transactionType == TransactionType.income
            ? AppColors.k00A86B
            : AppColors.k0077FF;

    await fetchCategories();
  }

  Future<void> fetchCategories() async {
    // await FirestoreHelper.fetchCategories();
  }

  void onContinue() {}
}
