import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maney_manager/controller/expenses_controller.dart';
import 'package:maney_manager/controller/income_controller.dart';
import 'package:maney_manager/controller/savings_controller.dart';
import 'package:maney_manager/utils/constants.dart';

import 'routes.dart';
import 'utils/theme.dart';

void main() {
  runApp(const MyApp());
  Get.put(IncomeController());
  Get.put(ExpensesController());
  Get.put(SavingsController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appTitle,
      theme: appTheme,
      getPages: AppRoutes.routes,
      initialRoute: '/home',
    );
  }
}
