import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void addNewTransaction() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return Placeholder();
      },
    );
  }

  AppBar systemAppropriateAppBar() {
    return AppBar(
      title: Text("Personal Expenses"),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.add),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: mediaQuery.size.height * 0.3,
                child: Placeholder(),
              ),
              Container(
                height: mediaQuery.size.height * 0.7,
                child: Placeholder(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
