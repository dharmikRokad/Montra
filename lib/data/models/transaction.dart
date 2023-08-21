import 'package:montra/data/enums/transaction_type.dart';
import 'account.dart';

class UserTransaction {
  const UserTransaction({
    required this.type,
    required this.category,
    required this.amount,
    required this.account,
    required this.date,
    this.note,
    this.imgRef,
  });

  factory UserTransaction.fromJson(Map<String, dynamic> map) {
    return UserTransaction(
      type: TransactionType.fromString(map['type']),
      category: map['category'],
      account: Account.fromJson(map['account']),
      amount: map['amount'],
      date: map['date'],
      note: map['note'],
      imgRef: map['image'],
    );
  }

  UserTransaction.empty({
    this.type,
    this.category,
    this.amount,
    this.account,
    this.date,
    this.note,
    this.imgRef,
  });

  final TransactionType? type;
  final String? category;
  final double? amount;
  final Account? account;
  final DateTime? date;
  final String? note;
  final String? imgRef;

  Map<String, dynamic> toJson() => {
        'type': type.toString(),
        'category': category,
        'account': account?.toJson(),
        'amount': account,
        'date': date,
        'note': note,
        'image': imgRef,
      };
}
