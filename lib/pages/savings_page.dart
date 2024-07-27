import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maney_manager/controller/savings_controller.dart';
import 'package:maney_manager/widgets/transaction_tile.dart';


class SavingsPage extends StatelessWidget {
  final SavingsController savingsController = Get.find();

   SavingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (savingsController.savingsList.isEmpty) {
          return const Center(child: Text('No savings transactions yet.'));
        }
        return ListView.builder(
          itemCount: savingsController.savingsList.length,
          itemBuilder: (context, index) {
            final transaction = savingsController.savingsList[index];
            return TransactionTile(transaction: transaction);
          },
        );
      }),
    );
  }
}
