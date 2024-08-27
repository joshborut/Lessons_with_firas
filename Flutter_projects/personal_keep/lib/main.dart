import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/home_screen.dart';
import 'utils/shared_functions.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  Widget _systemAppropriateAppBar(WidgetRef ref) {
    if (Platform.isIOS) {
      return CupertinoNavigationBar(
        middle: Text("Personal Expenses"),
        trailing: IconButton(
          onPressed: () => addNewTxBottomSheet(ref),
          icon: Icon(Icons.add),
        ),
      );
    }
    return AppBar(
      title: Text("Personal Expenses"),
      actions: [
        IconButton(
          onPressed: () => addNewTxBottomSheet(ref),
          icon: Icon(Icons.add),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar:
                _systemAppropriateAppBar(ref) as CupertinoNavigationBar,
            child: HomeScreen(),
          )
        : Scaffold(
            appBar: _systemAppropriateAppBar(ref) as AppBar,
            body: HomeScreen(),
          );
  }
}
