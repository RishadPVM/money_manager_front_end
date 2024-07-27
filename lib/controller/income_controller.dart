import 'package:get/get.dart';
import 'package:maney_manager/model/transaction_model.dart';

class IncomeController extends GetxController {
  var incomeList = <Transaction>[].obs;

  void addIncome(double amount, String category) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      amount: amount,
      date: DateTime.now(),
      category: category,
    );
    incomeList.add(newTransaction);
  }
}
