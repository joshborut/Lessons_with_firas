import 'package:flutter/material.dart';

import '../app_constants.dart';
import '../model/food_box.dart';
import '../utility/size_config.dart';

class FoodBoxTile extends StatefulWidget {
  const FoodBoxTile({
    super.key,
    required this.foodBox,
  });

  final FoodBox foodBox;

  @override
  State<FoodBoxTile> createState() => _FoodBoxTileState();
}

class _FoodBoxTileState extends State<FoodBoxTile> {
  late bool tileIsClicked;
  late Color tileBgColor;

  @override
  void initState() {
    tileIsClicked = false;
    tileBgColor = Colors.grey;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.scaledHeight(1),
        horizontal: SizeConfig.scaledWidth(3),
      ),
      child: ListTile(
        onTap: () {
          setState(() {
            tileBgColor = tileIsClicked
                ? Colors.grey
                : Theme.of(context).colorScheme.primary;
            tileIsClicked = !tileIsClicked;
          });
        },
        tileColor: tileBgColor,
        leading: Icon(
          Icons.verified_user,
          size: SizeConfig.scaledHeight(5),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppConstants.circleRadius,
        ),
        title: Text(
          widget.foodBox.name,
        ),
        subtitle: Text(
          widget.foodBox.description,
        ),
      ),
    );
  }
}
