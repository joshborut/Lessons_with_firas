import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../app_constants.dart';
import '../utility/user_info_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = "/";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 1;

  @override
  void initState() {
    // var box = Hive.box(AppConstants.boxName);
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user != null) {
          print(user.uid);
          // box.put("userID", user.uid);
          UserInfoBox.setUserId(user.uid);
        }
      },
    );
    // print("box.get value is ${box.get("userID")}");
    super.initState();
  }

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
