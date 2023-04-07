import 'package:flutter/material.dart';
import 'package:food_boxes/screens/auth_screen.dart';

import 'screens/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(builder: ((context) => AuthScreen()));
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: ((context) => HomeScreen()));
    default:
      return MaterialPageRoute(builder: ((context) => AuthScreen()));
  }
}
