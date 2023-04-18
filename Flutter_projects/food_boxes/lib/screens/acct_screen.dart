import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_boxes/screens/reset_pw_screen.dart';
import 'package:food_boxes/widgets/custom_txt_field.dart';
import '../utility/size_config.dart';
import 'auth_screen.dart';
import 'home_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});
  static const String routeName = "acct";
  static const String exampleText = "Josh";
  static const String exampleNumber = "15";

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.scaledHeight(3),
              horizontal: SizeConfig.scaledWidth(10),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle_outlined,
                    size: SizeConfig.scaledHeight(10),
                  ),
                  SizedBox(
                    height: SizeConfig.scaledHeight(3),
                  ),
                  CustomTxtFormField(
                    initialValue: AccountScreen.exampleText,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter your first name.";
                      }
                      return null;
                    },
                    prefixIconWidget: Icon(Icons.face),
                    label: "First Name",
                  ),
                  SizedBox(
                    height: SizeConfig.scaledHeight(1),
                  ),
                  CustomTxtFormField(
                    initialValue: AccountScreen.exampleText,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter your last name.";
                      }
                      return null;
                    },
                    prefixIconWidget: Icon(Icons.face),
                    label: "Last Name",
                  ),
                  SizedBox(
                    height: SizeConfig.scaledHeight(1),
                  ),
                  CustomTxtFormField(
                    initialValue: AccountScreen.exampleNumber,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter your age.";
                      }
                      return null;
                    },
                    inputType: TextInputType.number,
                    prefixIconWidget: Icon(Icons.numbers),
                    label: "Age",
                  ),
                  SizedBox(
                    height: SizeConfig.scaledHeight(1),
                  ),
                  ListTile(
                    tileColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    leading: Icon(Icons.logout),
                    title: Text("Logout"),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(AuthenticationScreen.routeName);
                    },
                  ),
                  SizedBox(
                    height: SizeConfig.scaledHeight(1),
                  ),
                  ListTile(
                    tileColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    leading: Icon(Icons.key),
                    title: Text("Reset Password"),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(ResetPasswordScreen.routeName);
                    },
                  ),
                  SizedBox(
                    height: SizeConfig.scaledHeight(1),
                  ),
                  ListTile(
                    tileColor: Colors.red[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    leading: Icon(Icons.delete_forever),
                    title: Text("Delete Account"),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: SizeConfig.scaledHeight(0.5),
                                  ),
                                  child: Text(
                                    "Are you sure?",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: SizeConfig.scaledHeight(0.5),
                                  ),
                                  child: Text(
                                    "Deleting your account is "
                                    "permanent and irreversible",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              CupertinoDialogAction(
                                onPressed: () => Navigator.of(context)
                                    .pushNamed(AuthenticationScreen.routeName),
                                child: Text("Yes"),
                              ),
                              CupertinoDialogAction(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text("No"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "Account",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Schedule",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: "Tickets",
          ),
        ],
        onTap: (int index) {
          Navigator.of(context).pushNamed(HomeScreen.routeNames[index]);
        },
      ),
    );
  }
}
