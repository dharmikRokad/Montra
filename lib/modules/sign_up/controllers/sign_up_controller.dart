import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:montra/data/helper/firestore/firestore_helper.dart';
import 'package:montra/data/helper/get_storage/storage_helper.dart';
import 'package:montra/data/providers/user_provider.dart';
import 'package:montra/data/services/firebase/firebase_auth_service.dart';
import 'package:montra/routes/app_routes.dart';
import 'package:montra/ui/app_snackbar.dart';

import '../../../data/constants/storage_constants.dart';

class SignUpController extends GetxController {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  RxBool isPassVisible = false.obs;
  RxBool isTermsAccepted = false.obs;
  RxBool isSignUpLoading = false.obs;
  RxBool isGoogleLoading = false.obs;

  RxBool get isFormValidate =>
      ((formKey.currentState?.validate() ?? false) && isTermsAccepted()).obs;

  void onCheckBoxTapped(bool? value) {
    isTermsAccepted(value);
  }

  void onPassHideTap() {
    isPassVisible(!isPassVisible());
  }

  void onSignUpClick() async {
    if (isFormValidate()) {
      isSignUpLoading(true);
      try {
        final User? user = await FireAuthService.signUpWithEmail(
          emailController.text,
          passController.text,
        );

        if (user != null) {
          await UserProvider.onLogin(user, nameController.text);
          _moveNext();
        }
      } on FirebaseAuthException catch (e) {
        isSignUpLoading(false);
        if (e.code == "weak-password") {
          formKey.currentState?.fields['pass']?.invalidate(
              'Password should be at least 6 characters, 1 capital, 1 number, 1 sign.');
        } else if (e.code == "email-already-in-use") {
          formKey.currentState?.fields['email']?.invalidate(
              'Email address is already in use by another account.');
        } else {
          formKey.currentState?.fields['email']
              ?.invalidate('Enter valid email.');
        }
      } finally {
        isSignUpLoading(false);
      }
    }
  }

  void onSignUpWithGoogle() async {
    isGoogleLoading(true);
    try {
      User? user =
          await FireAuthService.signInWithGoogle().then((value) => value.user);

      if (user != null) {
        await UserProvider.onLogin(user, user.displayName ?? '');
        _moveNext();
      }
    } on FirebaseAuthException catch (e) {
      isGoogleLoading(false);
      showSnack(e.message ?? '', SnackType.error);
    } finally {
      isGoogleLoading(false);
    }
  }

  void _moveNext() {
    Get.offAllNamed(
        UserProvider.isAlreadyAdded ? Routes.home : Routes.setupAccount);
    showSnack('Signed up successfully.', SnackType.success);
  }

  void onLoginClick() {
    Get.offNamed(Routes.logIn);
  }
}
