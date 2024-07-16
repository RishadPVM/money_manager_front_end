// api_transactions_controller.dart

import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:maney_manager/model/user_model.dart';

import '../const/backend_const/backend_const.dart';


class ApiTransactionsController extends GetxController {
  static final ApiURL apiUrl = ApiURL();

  var jwtToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2OTNiMjE1Y2FjZWQ2ZDA4YzIzMTM5OSIsImlhdCI6MTcyMTE0MTU5NywiZXhwIjoxNzIxMjI3OTk3fQ.dymoWct_IZww_SCblrQPADeUPCTAywTSCHmFkgP33oQ'.obs;
  var isLoading = false.obs;
  var transactionList = <TransactionModel>[].obs;

  Future<void> getAllTransactions() async {
  isLoading(true);
  String url = apiUrl.baseUrl + apiUrl.eNPtransactions;
  final headers = {
    'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2OTNiMjE1Y2FjZWQ2ZDA4YzIzMTM5OSIsImlhdCI6MTcyMTE0MTU5NywiZXhwIjoxNzIxMjI3OTk3fQ.dymoWct_IZww_SCblrQPADeUPCTAywTSCHmFkgP33oQ',
    'Content-Type': 'application/json',
  };

  try {
    final res = await http.get(
      Uri.parse(url), // Use the constructed URL here
      headers: headers,
    );

    log('Response status code: ${res.statusCode}');

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body) as List; // Ensure this matches your response structure
      log('Response data: $data');

      transactionList.value = data.map((transactionJson) => TransactionModel.fromJson(transactionJson)).toList();
      log('Number of transactions: ${transactionList.length}');
    } else {
      log('Failed to load transactions, status code: ${res.statusCode}');
    }
  } catch (e) {
    log('Error: $e');
  } finally {
    isLoading(false);
  }
}

}
