import 'package:flutter/material.dart';

import '../screens/reg_screen.dart';
import '../utility/size_config.dart';
import 'custom_txt_field.dart';

class EmailPasswordPage extends StatefulWidget {
  const EmailPasswordPage({
    required this.passedRouteName,
    required this.titleText,
    required this.subtitle,
    super.key,
  });

  final String passedRouteName;
  final String titleText;
  final String subtitle;

  @override
  State<EmailPasswordPage> createState() => _EmailPasswordPageState();
}

class _EmailPasswordPageState extends State<EmailPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  late final String currentRoute;

  void _submitFormData() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pushNamed(widget.passedRouteName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)!.settings.name!;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.titleText,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            widget.subtitle,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.grey),
          ),
          SizedBox(
            height: SizeConfig.scaledHeight(5),
          ),
          CustomTxtFormField(
            validator: (value) {
              if (value.isEmpty) return "Please enter your email";
              return null;
            },
            prefixIconWidget: Icon(Icons.email),
            label: "Email",
          ),
          SizedBox(
            height: SizeConfig.scaledHeight(1),
          ),
          CustomTxtFormField(
            validator: (value) {
              if (value.isEmpty) return "Please enter your password";
              if (currentRoute == RegisterationScreen.routeName &&
                  value.length > 64) {
                return "Password must not have more than 64 characters)";
              }
              return null;
            },
            prefixIconWidget: Icon(Icons.lock),
            obscureText: true,
            label: "Password",
          ),
          Container(
            padding: EdgeInsets.only(top: SizeConfig.scaledHeight(1)),
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: _submitFormData,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Submit"),
                  Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
