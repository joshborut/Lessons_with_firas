import 'package:flutter/material.dart';
import 'package:food_boxes/model/bottom_bar_items.dart';
import 'package:food_boxes/widgets/account_page.dart';

import 'widgets/schedule_page.dart';
import 'widgets/tickets_page.dart';

class AppConstants {
  AppConstants._();

  static const circleRadius = BorderRadius.all(Radius.circular(20));

  static const menuItemList = [
    BottomBarItems(
      iconData: Icons.account_circle_outlined,
      bodyBuild: AccountPage(),
      labelText: "Account",
    ),
    BottomBarItems(
      iconData: Icons.calendar_month,
      bodyBuild: SchedulePage(),
      labelText: "Schedule",
    ),
    BottomBarItems(
      iconData: Icons.receipt,
      bodyBuild: TicketsPage(),
      labelText: "Tickets",
    )
  ];
}
