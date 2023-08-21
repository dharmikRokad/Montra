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

  static RxString uid = UserProvider.user.uid.obs;

  static Future<void> addUser(User user, String name) async {
    uid(user.uid);
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

  static Future<void> updateProfilePic(String path) async {
    await users.doc(uid()).update({'imgRef': path});
  }

  static Future<void> updateName(String name) async {
    await users.doc(uid()).update({'name': name});
  }

  static addTransaction(UserTransaction transaction) async {
    CollectionReference<Map<String, dynamic>> transactions =
        users.doc(uid()).collection(FirestoreConsts.transactions);

    await transactions.add(transaction.toJson());
  }

  static addAccount(Account account) async {
    CollectionReference<Map<String, dynamic>> accounts =
        users.doc(uid.value).collection(FirestoreConsts.accounts);

    await accounts.add(account.toJson());
  }

  static updateAccount(String id, Account account) async {
    await users
        .doc(uid())
        .collection(FirestoreConsts.accounts)
        .doc(id)
        .update(account.toJson());
  }
}
