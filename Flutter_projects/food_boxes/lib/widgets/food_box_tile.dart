import 'package:flutter/material.dart';

import '../app_constants.dart';
import '../model/food_box.dart';
import '../utility/size_config.dart';

class FoodBoxTile extends StatelessWidget {
  const FoodBoxTile({
    super.key,
    required this.foodBox,
  });

  final FoodBox foodBox;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: SizeConfig.scaledHeight(7),
        width: SizeConfig.scaledWidth(39),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.green[500],
          borderRadius: AppConstants.circleRadius,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              foodBox.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.scaledHeight(2.25),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
