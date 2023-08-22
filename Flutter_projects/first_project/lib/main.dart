import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screens/home_screen.dart';
import '../screens/result_screen.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "myfirstapp",
      // home: MyHomePage(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF883B96),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/result-screen': (context) => ResultScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      },
    );
  }
}
