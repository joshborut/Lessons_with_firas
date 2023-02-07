// ignore_for_file: prefer_const_constructors

import 'package:first_project/screens/my_home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "myfirstapp",
      home: MyHomePage(),
    );
  }
}
