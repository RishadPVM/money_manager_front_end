import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maney_manager/controller/savings_controller.dart';

class CreateSavingsPage extends StatelessWidget {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final SavingsController savingsController = Get.find();

  CreateSavingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Savings'),
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

                savingsController.addSavings(amount, category);
                Get.back();
              },
              child: const Text('Add Savings'),
            ),
          ],
        ),
      ),
    );
  }
}
