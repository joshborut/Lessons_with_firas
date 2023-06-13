import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_boxes/utility/shared_functions.dart';

import '../screens/auth_screen.dart';
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
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool submitClicked = false;
  String? currentRoute;

  void _submitFormData() async {
    if (_formKey.currentState!.validate()) {
      try {
        if (currentRoute == AuthenticationScreen.routeName) {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text,
          );
        }
        if (currentRoute == RegisterationScreen.routeName) {
          setState(() => submitClicked = true);
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text,
          );
        }
        if (context.mounted) {
          _emailController.clear();
          _passwordController.clear();
          Navigator.of(context).pushNamed(widget.passedRouteName);
        }
      } on FirebaseAuthException catch (e) {
        print("Failed with error code: ${e.code}");
        FocusManager.instance.primaryFocus?.unfocus();
        String snackBarMessege;
        if (e.code == "invalid-email") {
          snackBarMessege = "Invalid email";
        } else if (e.code == "user-not-found") {
          snackBarMessege = "User does not exist";
        } else if (e.code == "wrong-password") {
          snackBarMessege = "Incorrect password";
        } else if (e.code == "email-already-in-use") {
          snackBarMessege = "An account already exists with this email";
        } else {
          snackBarMessege = e.message!;
        }
        ScaffoldMessenger.of(context).showSnackBar(
          messegeSnackBar(
            snackBarMessege,
            timeUp: 5000,
          ),
        );
        setState(() => submitClicked = false);
      } catch (e) {
        setState(() => submitClicked = false);
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    currentRoute = ModalRoute.of(context)!.settings.name!;
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
            controller: _emailController,
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
            controller: _passwordController,
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
              onPressed: !submitClicked ? _submitFormData : null,
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
