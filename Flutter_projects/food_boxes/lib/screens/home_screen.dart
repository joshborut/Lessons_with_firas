import 'package:flutter/material.dart';

import '../app_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = "/";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: AppConstants.menuItemList[pageIndex].bodyBuild,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => setState(() => pageIndex = index),
        items: AppConstants.menuItemList
            .map(
              (e) => BottomNavigationBarItem(
                label: e.labelText,
                icon: Icon(e.iconData),
              ),
            )
            .toList(),
        currentIndex: pageIndex,
      ),
    );
  }
}
