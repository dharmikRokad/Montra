enum AccountType {
  bank,
  wallet,
  cash;

  static AccountType fromString(String value) {
    switch (value) {
      case 'bank':
        return AccountType.bank;
      case 'wallet':
        return AccountType.wallet;
      case 'cash':
        return AccountType.cash;
      default:
        throw ArgumentError('Invalid AccountType value: $value');
    }
  }

  @override
  String toString() {
    switch (this) {
      case AccountType.bank:
        return 'bank';
      case AccountType.wallet:
        return 'wallet';
      case AccountType.cash:
        return 'cash';
    }
  }
}
