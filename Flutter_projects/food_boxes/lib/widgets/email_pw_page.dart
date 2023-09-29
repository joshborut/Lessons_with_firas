import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_boxes/screens/home_screen.dart';
import 'package:food_boxes/utility/shared_functions.dart';

import '../screens/auth_screen.dart';
import '../screens/reg_screen.dart';
import '../utility/size_config.dart';
import 'custom_txt_field.dart';

class EmailPasswordPage extends StatefulWidget {
  const EmailPasswordPage({
    required this.titleText,
    required this.subtitle,
    super.key,
  });

  final String titleText;
  final String subtitle;

  @override
  State<EmailPasswordPage> createState() => _EmailPasswordPageState();
}

class _EmailPasswordPageState extends State<EmailPasswordPage> {
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool submitClickable = true;
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
          setState(() => submitClickable = false);
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text,
          );
        }
        if (context.mounted) {
          _emailController.clear();
          _passwordController.clear();
          Navigator.of(context).pushNamed(HomeScreen.routeName);
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
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            messegeSnackBar(
              snackBarMessege,
              timeUp: 1750,
            ),
          );
        }
      } catch (e) {
        print(e);
      } finally {
        setState(() => submitClickable = true);
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
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.grey,
                ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: SizeConfig.scaledHeight(5),
              bottom: SizeConfig.scaledHeight(1),
            ),
            child: CustomTxtFormField(
              controller: _emailController,
              validator: (value) {
                if (value.trim().isEmpty || !value.contains('@')) {
                  return "Please enter your email";
                }
                return null;
              },
              prefixIconWidget: Icon(Icons.email),
              decorationLabel: "Email",
            ),
          ),
          CustomTxtFormField(
            controller: _passwordController,
            validator: (value) {
              if (value.trim().isEmpty) return "Please enter your password";
              if (currentRoute == RegisterationScreen.routeName &&
                  value.length > 64 &&
                  value.length < 6) {
                return "Password must be between 6 and 64 characters)";
              }
              return null;
            },
            prefixIconWidget: Icon(Icons.lock),
            obscureText: true,
            decorationLabel: "Password",
          ),
          Container(
            padding: EdgeInsets.only(
              top: SizeConfig.scaledHeight(1),
            ),
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: submitClickable ? _submitFormData : null,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: SizeConfig.scaledHeight(2),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.scaledWidth(1),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: SizeConfig.scaledHeight(2),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
