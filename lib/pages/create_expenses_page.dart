import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maney_manager/controller/expenses_controller.dart';

class CreateExpensesPage extends StatelessWidget {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final ExpensesController expensesController = Get.find();

  CreateExpensesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: amountController,
              decoration: const InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: categoryController,
              decoration: const InputDecoration(labelText: 'Category'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double amount = double.parse(amountController.text);
                String category = categoryController.text;

                expensesController.addExpense(amount, category);
                Get.back();
              },
              child: const Text('Add Expense'),
            ),
          ],
        ),
      ),
    );
  }
}
