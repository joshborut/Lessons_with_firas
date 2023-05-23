import 'package:flutter/material.dart';
import 'package:food_boxes/app_constants.dart';

import '../app_icons.dart';
import '../utility/size_config.dart';

class TicketsPage extends StatelessWidget {
  const TicketsPage({super.key});

  Widget innerRow(IconData iconData, String text) {
    return Row(
      children: [
        Icon(
          iconData,
          color: Colors.black,
        ),
        SizedBox(
          width: SizeConfig.scaledWidth(3),
        ),
        Text(
          text,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: AppConstants.circleRadius,
          ),
          elevation: 4,
          margin: EdgeInsets.symmetric(
            vertical: SizeConfig.scaledHeight(1.5),
            horizontal: SizeConfig.scaledWidth(3),
          ),
          child: Column(children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    'https://cdn.pixabay.com/photo/2018/07/'
                    '11/21/51/toast-3532016_1280.jpg',
                    height: SizeConfig.scaledHeight(30),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: SizeConfig.scaledHeight(2),
                  right: SizeConfig.scaledWidth(1),
                  child: Container(
                    width: SizeConfig.scaledWidth(70),
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.scaledHeight(1),
                      horizontal: SizeConfig.scaledWidth(1.5),
                    ),
                    color: Colors.black54,
                    child: Text(
                      "Hawaii Toast",
                      style: TextStyle(fontSize: 26, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  innerRow(AppIcons.calendar, "5/23/23"),
                  innerRow(Icons.attach_money, "5.00"),
                ],
              ),
            )
          ]),
        );
      },
    );
  }
}
