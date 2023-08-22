import 'package:flutter/material.dart';

import '../app_constants.dart';
import '../utility/size_config.dart';

class GestureContainer extends StatelessWidget {
  const GestureContainer({
    required this.passedFunction,
    required this.textToShow,
    super.key,
  });

  final Function passedFunction;
  final String textToShow;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => passedFunction(),
      child: Container(
        height: SizeConfig.scaledHeight(6),
        width: SizeConfig.scaledWidth(50),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.scaledWidth(5),
        ),
        decoration: BoxDecoration(
          borderRadius: AppConstants.circleRadius,
          gradient: LinearGradient(
            colors: [
              Color(0xFF883B96),
              Color(0xFF29699C),
            ],
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          textToShow,
          style: TextStyle(
            fontSize: SizeConfig.scaledHeight(3),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
