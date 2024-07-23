import 'package:flutter/material.dart';
import 'package:personal_keep/models/transaction.dart';
import 'package:personal_keep/utils/shared_functions.dart';
import 'package:personal_keep/widgets/expense_chart.dart';
import 'package:personal_keep/widgets/new_transaction.dart';

import '../app_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void addNewTxBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return NewTransaction(
          function: (String title, double amount, DateTime chosenDate) {
            final newTx = Transaction(
              id: DateTime.now().toString(),
              title: title,
              amount: amount,
              date: chosenDate,
            );
            setState(() => AppConstants.userTransactions.add(newTx));
          },
        );
      },
    );
  }

  AppBar systemAppropriateAppBar() {
    return AppBar(
      title: Text("Personal Expenses"),
      actions: [
        IconButton(
          onPressed: addNewTxBottomSheet,
          icon: Icon(Icons.add),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: systemAppropriateAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: mediaQuery.size.height * 0.3,
                child: ExpenseChart(
                  recentTransactions: getRecentTransactions(),
                ),
              ),
              Container(
                height: mediaQuery.size.height * 0.7,
                // TODO: Create necessary widget
                child: Placeholder(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
