import 'package:firebase_auth/firebase_auth.dart';
import 'package:montra/data/config/logger.dart';
import 'package:montra/data/constants/storage_constants.dart';
import 'package:montra/data/helper/firestore/firestore_helper.dart';
import 'package:montra/data/helper/get_storage/storage_helper.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class UserProvider {
  static RxString _uid = ''.obs;
  static String? _name;
  static String? _imgRef;
  static late bool _isLoggedIn;
  static late bool _isAlreadyAdded;

  static bool get isLoggedIn => _isLoggedIn;

  static bool get isAlreadyAdded => _isAlreadyAdded;

  static String? get imgRef => _imgRef;

  static String? get name => _name;

  static String? get uid => _uid();

  static Future<void> onLogin(User user, String name) async {
    _isLoggedIn = true;
    _uid(user.uid);
    _name = name;
    _isAlreadyAdded = await FirestoreHelper.alreadyAddedToFireStore();
    logI(_isAlreadyAdded);
    logI(isAlreadyAdded);
    await StorageHelper.writeBool(StorageConsts.loggedIn, true);
    await StorageHelper.write(StorageConsts.uid, user.uid);
    if (!isAlreadyAdded) {
      await FirestoreHelper.addUser(user, name);
    }
  }

  static Future<void> getNameAndPic() async {
    _name = await FirestoreHelper.getName();
    _imgRef = await FirestoreHelper.getProfilePic();
  }

  static Future<void> updateProfilePic(String path) async {
    await FirestoreHelper.updateProfilePic(path);
    _imgRef = path;
  }

  static Future<void> updateName(String name) async {
    await FirestoreHelper.updateName(name);
    _name = name;
  }

  ///Load [currentUser] and [authToken]
  static Future<void> loadUser() async {
    final String? storedUid = await StorageHelper.read(StorageConsts.uid);
    if (storedUid?.isNotEmpty ?? false) {
      _isLoggedIn = true;
      _uid(storedUid);
      await getNameAndPic();
    } else {
      _isLoggedIn = false;
    }
  }

  ///Remove [currentUser] and [authToken] from local storage
  static Future<void> onLogout() async {
    _isLoggedIn = false;
    _uid('');
    await StorageHelper.remove(StorageConsts.loggedIn);
    await StorageHelper.remove(StorageConsts.uid);
  }

  static String get initialRoute =>
      isLoggedIn && uid != null ? Routes.home : Routes.splash;
}
