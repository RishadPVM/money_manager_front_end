import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maney_manager/pages/expenses_page.dart';
import 'package:maney_manager/pages/income_page.dart';
import 'package:maney_manager/pages/savings_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'create_expenses_page.dart';
import 'create_income_page.dart';
import 'create_savings_page.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Income'),
    const Tab(text: 'Expenses'),
    const Tab(text: 'Savings'),
  ];

   HomePage({super.key});

  Future<void> _handleLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('jwt');
    Get.offAll(() => LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Money Management'),
          bottom: TabBar(
            tabs: myTabs,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: _handleLogout,
            ),
          ],
        ),
        body: TabBarView(
          children: [
            IncomePage(),
            ExpensesPage(),
            SavingsPage(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showCreateOptions(context);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void _showCreateOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Add Income'),
              onTap: () {
                Get.to(() => CreateIncomePage());
              },
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Add Expense'),
              onTap: () {
                Get.to(() => CreateExpensesPage());
              },
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Add Savings'),
              onTap: () {
                Get.to(() => CreateSavingsPage());
              },
            ),
          ],
        );
      },
    );
  }
}
