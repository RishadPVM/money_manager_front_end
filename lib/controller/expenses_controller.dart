import 'package:get/get.dart';
import 'package:maney_manager/model/transaction_model.dart';

class ExpensesController extends GetxController {
  var expensesList = <Transaction>[].obs;

  void addExpense(double amount, String category) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      amount: amount,
      date: DateTime.now(),
      category: category,
    );
    expensesList.add(newTransaction);
  }
}
