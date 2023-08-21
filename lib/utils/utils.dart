import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  static DateFormat ddMMyyyyFormat = DateFormat('dd/MM/yyyy');

  static hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static getOnlyDate({required DateTime fromDate}) => ddMMyyyyFormat.format(fromDate);
}
