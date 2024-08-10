import 'package:flutter/material.dart';
import 'package:personal_keep/utils/shared_functions.dart';
import 'package:personal_keep/widgets/expense_chart.dart';

import '../app_constants.dart';
import '../widgets/transaction_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showChart = false;

  void _deleteTransaction(String id) {
    setState(() {
      AppConstants.userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Create appbar excluded screen height
    final mediaQuery = MediaQuery.of(context);
    if (mediaQuery.orientation == Orientation.landscape) {
      return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Show chart",
                    style: TextStyle(
                      fontFamily: "OpenSans",
                    ),
                  ),
                  Switch.adaptive(
                    value: _showChart,
                    onChanged: (val) => _showChart = val,
                    activeColor: Colors.yellow,
                  )
                ],
              ),
              Container(
                height: mediaQuery.size.height * 0.7,
                child: _showChart
                    ? ExpenseChart(
                        recentTransactions: getRecentTransactions(),
                      )
                    : TransactionList(
                        transactions: AppConstants.userTransactions,
                        deleteTx: _deleteTransaction,
                      ),
              )
            ],
          ),
        ),
      );
    }
    return SafeArea(
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
              child: TransactionList(
                transactions: AppConstants.userTransactions,
                deleteTx: _deleteTransaction,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
