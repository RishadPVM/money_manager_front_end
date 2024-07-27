import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maney_manager/controller/expenses_controller.dart';
import 'package:maney_manager/widgets/transaction_tile.dart';


class ExpensesPage extends StatelessWidget {
  final ExpensesController expensesController = Get.find();

   ExpensesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (expensesController.expensesList.isEmpty) {
          return const Center(child: Text('No expense transactions yet.'));
        }
        return ListView.builder(
          itemCount: expensesController.expensesList.length,
          itemBuilder: (context, index) {
            final transaction = expensesController.expensesList[index];
            return TransactionTile(transaction: transaction);
          },
        );
      }),
    );
  }
}
