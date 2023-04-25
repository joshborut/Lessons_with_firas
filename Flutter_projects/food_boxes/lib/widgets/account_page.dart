import 'package:flutter/material.dart';

import '../app_constants.dart';
import '../screens/auth_screen.dart';
import '../screens/reset_pw_screen.dart';
import '../utility/shared_functions.dart';
import '../utility/size_config.dart';
import 'custom_txt_field.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.scaledHeight(3),
        horizontal: SizeConfig.scaledWidth(10),
      ),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.scaledHeight(2),
              ),
              child: Icon(
                Icons.account_circle_outlined,
                size: SizeConfig.scaledHeight(10),
              ),
            ),
            SizedBox(
              height: SizeConfig.scaledHeight(1),
            ),
            CustomTxtFormField(
              initialValue: "exampleText",
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
              initialValue: "exampleText",
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
              initialValue: "exampleNumber",
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
              height: SizeConfig.scaledHeight(5),
            ),
            ListTile(
              tileColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: AppConstants.circleRadius,
              ),
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                Navigator.of(context).pushNamed(AuthenticationScreen.routeName);
              },
            ),
            SizedBox(
              height: SizeConfig.scaledHeight(1),
            ),
            ListTile(
              tileColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: AppConstants.circleRadius,
              ),
              leading: Icon(Icons.key),
              title: Text("Reset Password"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                Navigator.of(context).pushNamed(ResetPasswordScreen.routeName);
              },
            ),
            SizedBox(
              height: SizeConfig.scaledHeight(1),
            ),
            ListTile(
              tileColor: Colors.red[700],
              shape: RoundedRectangleBorder(
                borderRadius: AppConstants.circleRadius,
              ),
              leading: Icon(Icons.delete_forever),
              title: Text("Delete Account"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              onTap: () => yesNoDialogue(context),
            ),
          ],
        ),
      ),
    );
  }
}