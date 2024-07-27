import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maney_manager/controller/income_controller.dart';
import 'package:maney_manager/widgets/transaction_tile.dart';


class IncomePage extends StatelessWidget {
  final IncomeController incomeController = Get.find();

   IncomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (incomeController.incomeList.isEmpty) {
          return const Center(child: Text('No income transactions yet.'));
        }
        return ListView.builder(
          itemCount: incomeController.incomeList.length,
          itemBuilder: (context, index) {
            final transaction = incomeController.incomeList[index];
            return TransactionTile(transaction: transaction);
          },
        );
      }),
    );
  }
}
