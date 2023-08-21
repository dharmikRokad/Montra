import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:montra/data/constants/firestore_constants.dart';
import 'package:montra/data/helper/firestore/firestore_helper.dart';
import 'package:montra/data/helper/img_picker/img_picker_helper.dart';
import 'package:montra/data/providers/user_provider.dart';
import 'package:montra/routes/app_routes.dart';

class AddProfilePicController extends GetxController {
  RxString imgPath = ''.obs;

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
      FirebaseStorage storage = FirebaseStorage.instance;

      Reference ref = storage.ref(UserProvider.user.uid).child(imgPath());
      await ref.putData(await File(imgPath()).readAsBytes());

      await UserProvider.updateProfilePic(ref.fullPath);

      Get.toNamed(Routes.addNewAccount);
    }
  }

  onSkip() async {
    await FirestoreHelper.users
        .doc(FirestoreHelper.uid())
        .collection('/userInfo')
        .doc('BpfSvVplWsKwH36qCjH7')
        .update({
      'imgRef': 'https://cdn-icons-png.flaticon.com/128/1077/1077114.png'
    });

    Get.toNamed(Routes.addNewAccount);
  }
}
