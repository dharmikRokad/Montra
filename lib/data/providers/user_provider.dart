import 'package:firebase_auth/firebase_auth.dart';
import 'package:montra/data/helper/firestore/firestore_helper.dart';
import 'package:montra/data/services/firebase/firebase_auth_service.dart';

class UserProvider {
  static late final User _user;
  static late final String _name;
  static late final String _imgRef;
  static late bool _isLoggedIn;

  static bool get isLoggedIn => _isLoggedIn;

  static String get imgRef => _imgRef;

  static String get name => _name;

  static User get user => _user;

  static Future<void> onLogin(User user, String name) async {
    _isLoggedIn = true;
    _user = user;
    _name = name;

    await FirestoreHelper.addUser(user, name);
  }

  static Future<void> updateProfilePic(String path) async {
    await FirestoreHelper.updateProfilePic(path);
    _imgRef = path;
  }

  static Future<void> updateName(String name) async {
    await FirestoreHelper.updateName(name);
    _name = name;
  }
}
