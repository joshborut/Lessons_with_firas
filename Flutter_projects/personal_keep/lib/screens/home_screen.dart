import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_keep/utils/shared_functions.dart';
import 'package:personal_keep/widgets/expense_chart.dart';

import '../widgets/transaction_list.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool _showChart = false;

  void _deleteTransaction(String id) {
    ref.read(userTransactionProvider.notifier).update(
          (state) => [...state..removeWhere((tx) => tx.id == id)],
        );
  }

  @override
  Widget build(BuildContext context) {
    final userTransactions = ref.watch(userTransactionProvider);
    final recentTransactions = ref.watch(recentTransactionsProvider);
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
                        recentTransactions: recentTransactions,
                      )
                    : TransactionList(
                        transactions: userTransactions,
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
                recentTransactions: recentTransactions,
              ),
            ),
            Container(
              height: mediaQuery.size.height * 0.7,
              child: TransactionList(
                transactions: userTransactions,
                deleteTx: _deleteTransaction,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
