import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:montra/data/config/logger.dart';
import 'package:montra/data/helper/firestore/firestore_helper.dart';
import 'package:montra/data/helper/img_picker/img_picker_helper.dart';
import 'package:montra/data/providers/user_provider.dart';
import 'package:montra/routes/app_routes.dart';
import 'package:montra/ui/widgets/app_snackbar.dart';

class AddProfilePicController extends GetxController {
  RxString imgPath = ''.obs;
  RxBool isBtnLoading = false.obs;

  pickImage(ImageSource from) async {
    switch (from) {
      case ImageSource.camera:
        imgPath(await ImgPickerHelper.fromCamera());
        break;

      case ImageSource.gallery:
        imgPath(await ImgPickerHelper.fromGallery());
        break;
    }
  }

  onImgTap() {
    pickImage(ImageSource.gallery);
  }

  onContinue() async {
    if (imgPath.isNotEmpty) {
      isBtnLoading(true);
      try {
        FirebaseStorage storage = FirebaseStorage.instance;

        Reference ref = storage.ref(UserProvider.uid).child(imgPath());
        await ref.putData(await File(imgPath()).readAsBytes());

        await UserProvider.updateProfilePic(await ref.getDownloadURL());

        Get.toNamed(Routes.addNewAccount);
      } catch (e) {
        logE(e);
      } finally {
        isBtnLoading(false);
      }
    } else {
      appSnackbar(
        message: 'Please select valid image file.',
        snackbarState: SnackbarState.warning,
      );
    }
  }

  onSkip() async {
    await UserProvider.updateProfilePic(
        'https://cdn-icons-png.flaticon.com/128/1077/1077114.png');

    Get.toNamed(Routes.addNewAccount);
  }
}
