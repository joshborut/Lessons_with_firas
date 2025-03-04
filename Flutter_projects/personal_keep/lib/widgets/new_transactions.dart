import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:personal_keep/utility/user_transaction_notifier.dart';

import '../utility/shared_functions.dart';
import 'adaptive_button.dart';
import 'custom_text_field.dart';

class NewTransaction extends ConsumerStatefulWidget {
  const NewTransaction({super.key});

  @override
  ConsumerState<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends ConsumerState<NewTransaction> {
  // Used to control individual fields
  final _amountController = TextEditingController();
  final _titleController = TextEditingController();
  // Used to check multiple fields that make up a form
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  bool? _datePickerUsed;

  void _submitData() {
    if (_formKey.currentState!.validate() == false || _selectedDate == null) {
      showSnackBar("Please ensure all fields are provided");
      if (_datePickerUsed == null) {
        setState(() => _datePickerUsed = false);
      }
    } else {
      final enteredAmount = double.parse(_amountController.text);
      final title = _titleController.text;

      final userTxNotifier = ref.read(userTransactionProvider.notifier);
      userTxNotifier.addTransaction(title, enteredAmount, _selectedDate);
      Navigator.of(context).pop();
    }
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(
        Duration(days: 365),
      ),
      lastDate: DateTime.now(),
    ).then(
      (date) {
        if (date != null) {
          setState(() {
            _selectedDate = date;
            _datePickerUsed = true;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, mediaQuery.viewInsets.bottom),
      child: SizedBox(
        height: mediaQuery.orientation == Orientation.landscape
            ? mediaQuery.size.height * 0.75
            : mediaQuery.size.height * 0.45,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomTxtFormField(
                decorationLabel: "Title",
                controller: _titleController,
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return "Please enter a title.";
                  }
                  return null;
                },
                verticalContentPadding:
                    mediaQuery.orientation == Orientation.landscape ? 5 : 10,
              ),
              CustomTxtFormField(
                decorationLabel: "Amount",
                controller: _amountController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'[0-9]'),
                  ),
                ],
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
                verticalContentPadding:
                    mediaQuery.orientation == Orientation.landscape ? 5 : 10,
                validator: (value) {
                  if (value.trim().isEmpty ||
                      (double.parse(value.trim()) < 1 &&
                          double.parse(value.trim()) > 0)) {
                    return "Amount greater than zero.";
                  }
                  return null;
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 10, left: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? "No date chosen"
                            : "Picked date: ${DateFormat.yMd().format(
                                _selectedDate!,
                              )}",
                        style: TextStyle(
                          fontSize: _selectedDate == null ? 18 : 20,
                          color: _datePickerUsed != null &&
                                  _datePickerUsed == false
                              ? const Color(0xFF6A1513)
                              : const Color(0xFF000000),
                        ),
                      ),
                    ),
                    AdaptiveButton(
                      text: "Choose date",
                      handler: _presentDatePicker,
                    ),
                  ],
                ),
              ),
              AdaptiveButton(
                text: "Add transaction",
                handler: _submitData,
              )
            ],
          ),
        ),
      ),
    );
  }
}
