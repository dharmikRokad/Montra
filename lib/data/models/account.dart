import '../enums/account_type.dart';

class Account {
  const Account({
    required this.acName,
    required this.acType,
    this.balance = 0.0,
  });

  factory Account.fromJson(Map<String, dynamic> map) {
    return Account(
      acName: map['acName'],
      acType: AccountType.fromString(map['acType']),
      balance: map['balance'],
    );
  }

  Account.empty({
    this.acName,
    this.acType,
    this.balance,
  });

  final String? acName;
  final AccountType? acType;
  final double? balance;

  Map<String, dynamic> toJson() => {
        'acName': acName,
        'acType': acType.toString(),
        'balance': balance,
      };
}
