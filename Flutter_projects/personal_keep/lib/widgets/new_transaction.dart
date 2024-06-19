import 'package:flutter/material.dart';
import 'package:personal_keep/widgets/custom_txt_form_field.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction({
    super.key,
    required this.function,
  });

  final void Function() function;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // Used to control individual fields
  final _amountController = TextEditingController();
  final _titleController = TextEditingController();
  // Used to check multiple fields that make up a form
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, mediaQuery.viewInsets.bottom),
      child: SizedBox(
        height: mediaQuery.size.height * 0.45,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // TODO: Finish widgets
                CustomTxtFormField(
                    validator: (value) {
                      if (value.trim().isEmpty ||
                          (double.parse(value.trim()) < 1 &&
                              double.parse(value.trim()) > 0)) {
                        return "Amount greater than zero.";
                      }
                      return null;
                    },
                    decorationLabel: "Amount"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
