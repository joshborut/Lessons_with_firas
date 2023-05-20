import 'package:flutter/material.dart';
import 'package:food_boxes/app_constants.dart';

import '../utility/size_config.dart';

class TicketsPage extends StatelessWidget {
  const TicketsPage({super.key});

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
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    color: Colors.black54,
                    child: Text(
                      "Hawaii Toast",
                      style: TextStyle(fontSize: 26, color: Colors.white),
                    ),
                  ),
                )
              ],
            )
          ]),
        );
      },
    );
  }
}
