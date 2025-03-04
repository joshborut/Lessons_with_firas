import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utility/user_transaction_notifier.dart';
import '../widgets/transaction_list.dart';
import 'expenses_chart.dart';

class LandscapePage extends ConsumerStatefulWidget {
  const LandscapePage({
    required this.pageHeight,
    super.key,
  });

  final double pageHeight;

  @override
  ConsumerState<LandscapePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<LandscapePage> {
  bool _showChart = false;

  @override
  Widget build(BuildContext context) {
    final userTxNotifier = ref.watch(userTransactionProvider.notifier);
    final userTransactions = ref.watch(userTransactionProvider);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Show chart",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "OpenSans",
              ),
            ),
            SizedBox(width: 20),
            Switch.adaptive(
              value: _showChart,
              onChanged: (val) => setState(() => _showChart = val),
              activeColor: Colors.yellow,
            )
          ],
        ),
        SizedBox(
          height: widget.pageHeight * 0.7,
          child: _showChart
              ? ExpenseChart(
                  recentTransactions: userTxNotifier.recentTransactionsProvider,
                )
              : TransactionList(
                  transactions: userTransactions,
                ),
        )
      ],
    );
  }
}
