// transactions_home.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maney_manager/services/api.dart';


class TransactionsHome extends StatelessWidget {
  const TransactionsHome({super.key});

  @override
  Widget build(BuildContext context) {
    final ApiTransactionsController transactionsController = Get.put(ApiTransactionsController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          transactionsController.getAllTransactions();
        },
        child: const Icon(Icons.refresh),
      ),
      body: Column(
        children: [
          Obx(() {
            if (transactionsController.isLoading.value) {
              return const CircularProgressIndicator();
            } else if (transactionsController.transactionList.isEmpty) {
              return const Text('No transactions available');
            } else {
              return Expanded(
                child: ListView.builder(
                  itemCount: transactionsController.transactionList.length,
                  itemBuilder: (context, index) {
                    final transaction = transactionsController.transactionList[index];
                    return Card(
                      child: ListTile(
                        title: Text('Amount: ${transaction.amount}'),
                        subtitle: Text('Type: ${transaction.type.name}, Description: ${transaction.description ?? 'N/A'}'),
                      ),
                    );
                  },
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
