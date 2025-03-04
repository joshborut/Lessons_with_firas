import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_boxes/utility/dimensions_extensions.dart';

import '../generated/locale_keys.g.dart';
import '../widgets/email_pw_page.dart';
import 'reg_screen.dart';
import 'reset_pw_screen.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});
  static const String routeName = "auth";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: Container(
          width: context.safeWidth,
          height: context.safeHeight,
          padding: EdgeInsets.symmetric(
            vertical: context.percentHeight(10),
            horizontal: context.percentWidth(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EmailPasswordPage(
                titleText: LocaleKeys.authScrnTitle.tr(),
                subtitle: LocaleKeys.authScrnSubtitle.tr(),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(ResetPasswordScreen.routeName);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: context.safeWidth,
                  child: Text(
                    LocaleKeys.authScrnForgotPwBtn.tr(),
                    style: TextStyle(
                      fontSize: context.percentHeight(2),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.authScrnNewHere.tr(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context)
                        .pushNamed(RegisterationScreen.routeName),
                    child: Text(
                      LocaleKeys.authScrnCreateAcc.tr(),
                      style: TextStyle(
                        fontSize: context.percentHeight(2),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
