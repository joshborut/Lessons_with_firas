import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants.dart';
import '../models/transaction.dart';

final userTransactionProvider =
    NotifierProvider<TransactionListNotifier, List<Transaction>>(
        TransactionListNotifier.new);

class TransactionListNotifier extends Notifier<List<Transaction>> {
  @override
  List<Transaction> build() => AppConstants.userTransactions;

  void addTransaction(String title, double amount, DateTime? chosenDate) {
    final newTransaction = Transaction(
      id: DateTime.now.toString(),
      title: title,
      amount: amount,
      date: chosenDate,
    );
    state = [...state, newTransaction];
  }

  void deleteTransaction(String id) {
    state = [...state..removeWhere((tx) => tx.id == id)];
  }

  List<Transaction> get recentTransactionsProvider {
    return state.where(
      (tx) {
        tx.date ??= DateTime.now();
        return tx.date!.isAfter(
          DateTime.now().subtract(
            Duration(days: 7),
          ),
        );
      },
    ).toList();
  }
}
