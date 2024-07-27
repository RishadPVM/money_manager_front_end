import 'package:get/get.dart';
import 'package:maney_manager/pages/create_expenses_page.dart';
import 'package:maney_manager/pages/create_income_page.dart';
import 'package:maney_manager/pages/create_savings_page.dart';
import 'package:maney_manager/pages/home_page.dart';
import 'package:maney_manager/pages/login_page.dart';


class AppRoutes {
  static final routes = [
    GetPage(name: '/', page: () => LoginPage()),
    GetPage(name: '/home', page: () =>  HomePage()),
    GetPage(name: '/create-income', page: () => CreateIncomePage()),
    GetPage(name: '/create-expenses', page: () => CreateExpensesPage()),
    GetPage(name: '/create-savings', page: () => CreateSavingsPage()),
  ];
}