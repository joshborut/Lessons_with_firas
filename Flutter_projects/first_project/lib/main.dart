import 'package:first_project/screens/main_screen.dart';
import 'package:first_project/screens/result_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "myfirstapp",
      // home: MyHomePage(),
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/result-screen': (context) => ResultScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => MainScreen(),
        );
      },
    );
  }
}
