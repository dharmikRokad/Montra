enum TransactionType {
  expense,
  income,
  transfer;

  static TransactionType fromString(String value) {
    switch (value) {
      case 'expense':
        return TransactionType.expense;
      case 'income':
        return TransactionType.income;
      case 'transfer':
        return TransactionType.transfer;
      default:
        throw ArgumentError('Invalid AccountType value: $value');
    }
  }

  @override
  String toString() {
    switch (this) {
      case TransactionType.expense:
        return 'expense';
      case TransactionType.income:
        return 'income';
      case TransactionType.transfer:
        return 'transfer';
    }
  }
}
