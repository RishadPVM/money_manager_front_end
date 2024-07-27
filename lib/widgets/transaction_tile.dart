import 'package:flutter/material.dart';
import 'package:maney_manager/model/transaction_model.dart';

class TransactionTile extends StatelessWidget {
  final Transaction transaction;

  const TransactionTile({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(transaction.category),
      subtitle: Text(transaction.date.toString()),
      trailing: Text('\$${transaction.amount.toStringAsFixed(2)}'),
    );
  }
}
