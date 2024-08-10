import 'package:flutter/material.dart';

import '../app_constants.dart';
import '../models/transaction.dart';
import '../widgets/new_transaction.dart';

SnackBar getSnackBar(String message, {int timeUp = 500}) {
  return SnackBar(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    content: Text(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    ),
    duration: Duration(milliseconds: timeUp),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(
      left: 50,
      right: 50,
      bottom: 20,
    ),
  );
}

List<Transaction> getRecentTransactions() {
  return AppConstants.userTransactions.where(
    (tx) {
      tx.date ??= DateTime.now();
      return tx.date!.isAfter(DateTime.now().subtract(Duration(days: 7)));
    },
  ).toList();
}

void addNewTxBottomSheet(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (_) {
      return NewTransaction(
        function: (String title, double amount, DateTime chosenDate) {
          // ignore: unused_local_variable
          final newTx = Transaction(
            id: DateTime.now().toString(),
            title: title,
            amount: amount,
            date: chosenDate,
          );
          // TODO: Use riverpod to update app constants
          // setState(() => AppConstants.userTransactions.add(newTx));
        },
      );
    },
  );
}
