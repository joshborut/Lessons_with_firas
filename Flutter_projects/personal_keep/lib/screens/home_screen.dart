import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
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
