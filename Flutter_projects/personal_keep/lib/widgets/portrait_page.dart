import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utility/user_transaction_notifier.dart';
import '../widgets/transaction_list.dart';
import 'expenses_chart.dart';

class PortraitPage extends ConsumerWidget {
  const PortraitPage({
    required this.pageHeight,
    super.key,
  });

  final double pageHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userTxNotifier = ref.watch(userTransactionProvider.notifier);
    final userTransactions = ref.watch(userTransactionProvider);
    return Column(
      children: [
        Container(
          height: pageHeight * 0.3,
          child: ExpenseChart(
            recentTransactions: userTxNotifier.recentTransactionsProvider,
          ),
        ),
        Container(
          height: pageHeight * 0.7,
          child: TransactionList(
            transactions: userTransactions,
          ),
        ),
      ],
    );
  }
}
