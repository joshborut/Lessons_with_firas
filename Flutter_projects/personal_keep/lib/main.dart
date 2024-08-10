import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'utils/shared_functions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  AppBar _systemAppropriateAppBar(BuildContext context) {
    return AppBar(
      title: Text("Personal Expenses"),
      actions: [
        IconButton(
          onPressed: () => addNewTxBottomSheet(context),
          icon: Icon(Icons.add),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Platform.isIOS
          ? CupertinoPageScaffold(
              // TODO: Make appbar
              child: HomeScreen(),
            )
          : Scaffold(
              appBar: _systemAppropriateAppBar(context),
              body: HomeScreen(),
            ),
    );
  }
}
