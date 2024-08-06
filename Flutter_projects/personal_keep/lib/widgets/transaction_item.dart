import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:personal_keep/app_constants.dart';

import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    super.key,
    required this.transaction,
    required this.deleteTx,
  });

  final Transaction transaction;
  final Function deleteTx;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  late final Color bgColor;
  @override
  void initState() {
    bgColor = AppConstants.availableColors[Random().nextInt(
      AppConstants.availableColors.length,
    )];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Finish this
    return const Placeholder();
  }
}
