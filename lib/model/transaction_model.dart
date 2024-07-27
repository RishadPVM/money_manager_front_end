// models/transaction_model.dart
class Transaction {
  final String id;
  final double amount;
  final DateTime date;
  final String category;

  Transaction({
    required this.id,
    required this.amount,
    required this.date,
    required this.category,
  });
}
