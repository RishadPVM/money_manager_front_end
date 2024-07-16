class TransactionModel {
  final String userId;
  final TransactionType type;
  final double amount;
  final String? description;
  final DateTime date;

  TransactionModel({
    required this.userId,
    required this.type,
    required this.amount,
    this.description,
    DateTime? date,
  }) : date = date ?? DateTime.now();

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      userId: json['userId'],
      type: TransactionType.values.byName(json['type']),
      amount: (json['amount'] as num).toDouble(),
      description: json['description'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'type': type.name,
      'amount': amount,
      'description': description,
      'date': date.toIso8601String(),
    };
  }
}

enum TransactionType { income, expense }
