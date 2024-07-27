import 'package:get/get.dart';
import 'package:maney_manager/model/transaction_model.dart';

class SavingsController extends GetxController {
  var savingsList = <Transaction>[].obs;

  void addSavings(double amount, String category) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      amount: amount,
      date: DateTime.now(),
      category: category,
    );
    savingsList.add(newTransaction);
  }
}
