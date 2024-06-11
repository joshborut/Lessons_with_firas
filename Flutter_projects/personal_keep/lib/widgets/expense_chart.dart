import 'package:flutter/material.dart';
import 'package:personal_keep/models/transaction.dart';
import 'package:personal_keep/widgets/chart_bar.dart';

class ExpenseChart extends StatelessWidget {
  const ExpenseChart({super.key, required this.recentTransactions});

  final List<Transaction> recentTransactions;

  List<Map<String, dynamic>> get groupTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date?.day == weekDay.day &&
            recentTransactions[i].date?.month == weekDay.month &&
            recentTransactions[i].date?.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {'amount': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: recentTransactions.map((e) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                spendingAmount: 100,
                spendingPctOfTotal: 50,
                label: "Example Label",
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
