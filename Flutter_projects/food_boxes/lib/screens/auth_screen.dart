import 'package:flutter/material.dart';
import 'package:food_boxes/screens/home_screen.dart';
import 'package:food_boxes/screens/reg_screen.dart';
import 'package:food_boxes/screens/reset_pw_screen.dart';
import 'package:food_boxes/utility/size_config.dart';
import 'package:food_boxes/widgets/email_pw_page.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});
  static const String routeName = "auth";

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  void didChangeDependencies() {
    if (!SizeConfig.initialized) SizeConfig().int(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Container(
        width: SizeConfig.safeWidth,
        height: SizeConfig.safeHeight,
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.scaledHeight(10),
          horizontal: SizeConfig.scaledWidth(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EmailPasswordPage(
              passedRouteName: HomeScreen.routeName,
              titleText: "Login",
              subtitle: "Please sign in to proceed",
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(ResetPasswordScreen.routeName);
              },
              child: Container(
                alignment: Alignment.center,
                width: SizeConfig.safeWidth,
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "New here?",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(RegisterationScreen.routeName);
                  },
                  child: Text("Create an Account"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
