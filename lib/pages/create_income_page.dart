import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maney_manager/controller/income_controller.dart';

class CreateIncomePage extends StatelessWidget {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final IncomeController incomeController = Get.find();

  CreateIncomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Income'),
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

                incomeController.addIncome(amount, category);
                Get.back();
              },
              child: const Text('Add Income'),
            ),
          ],
        ),
      ),
    );
  }
}
