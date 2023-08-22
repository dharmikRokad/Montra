import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:montra/data/config/logger.dart';
import 'package:montra/data/constants/firestore_constants.dart';
import 'package:montra/data/models/account.dart';
import 'package:montra/data/models/transaction.dart';
import 'package:montra/data/providers/user_provider.dart';

class FirestoreHelper {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static CollectionReference<Map<String, dynamic>> users =
      firestore.collection(FirestoreConsts.users);

  /// Method to add users data (like null accounts & transactions ) to firestore
  static Future<void> addUser(User user, String name) async {

    users
      ..doc(user.uid).set(
          {'email': user.email, 'uid': user.uid, 'name': name, 'imgRef': ''})
      ..doc(user.uid)
          .collection(FirestoreConsts.transactions)
          .add(UserTransaction.empty().toJson())
      ..doc(user.uid)
          .collection(FirestoreConsts.accounts)
          .add(Account.empty().toJson());
  }


  /// Method to check if users data are already added or not
  static Future<bool> alreadyAddedToFireStore() async {
    logI(UserProvider.uid);
    return await users.doc(UserProvider.uid).get().then((value) => value.exists);
  }

  /// to Update profile pic
  static Future<void> updateProfilePic(String path) async {
    await users.doc(UserProvider.uid).update({'imgRef': path});
  }


  /// to Get current profile pic
  static Future<String> getProfilePic() async {
    return await users
        .doc(UserProvider.uid)
        .get()
        .then((value) => value.data()?['imgRef']);
  }


  /// to Update name
  static Future<void> updateName(String name) async {
    await users.doc(UserProvider.uid).update({'name': name});
  }

  ///to Get current name
  static Future<String> getName() async {
    return await users.doc(UserProvider.uid).get().then((value) => value.data()?['name']);
  }

  /// to add new transaction
  static addTransaction(UserTransaction transaction) async {
    CollectionReference<Map<String, dynamic>> transactions =
        users.doc(UserProvider.uid).collection(FirestoreConsts.transactions);

    await transactions.add(transaction.toJson());
  }

  /// to add new account
  static addAccount(Account account) async {
    CollectionReference<Map<String, dynamic>> accounts =
        users.doc(UserProvider.uid).collection(FirestoreConsts.accounts);

    await accounts.add(account.toJson());
  }

  /// to update existing account
  static updateAccount(String id, Account account) async {
    await users
        .doc(UserProvider.uid)
        .collection(FirestoreConsts.accounts)
        .doc(id)
        .update(account.toJson());
  }
}
