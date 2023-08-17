import 'package:flutter/material.dart';

import '../app_constants.dart';
import '../utility/size_config.dart';

class ChoiceOption extends StatefulWidget {
  const ChoiceOption({
    required this.answerText,
    required this.accuracy,
    super.key,
  });

  // Answer(int answerScore, String answerText, dynamic answerClicked) {
  //   answerText = answerText;
  //   answerScore = answerScore;
  //   answerClicked = answerClicked;
  // }

  // When a parameter is final, it must be required in the constructor
  final String answerText;
  final int accuracy;

  @override
  State<ChoiceOption> createState() => _ChoiceOptionState();
}

class _ChoiceOptionState extends State<ChoiceOption> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: _isSelected ? Colors.blue : Colors.white,
          border: Border.all(
            color: Colors.blue,
            width: 2,
          ),
          borderRadius: AppConstants.circleRadius,
        ),
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.scaledHeight(2),
          horizontal: SizeConfig.scaledWidth(2),
        ),
        margin: EdgeInsets.symmetric(
          vertical: SizeConfig.scaledHeight(0.5),
          horizontal: SizeConfig.scaledWidth(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.answerText,
              style: TextStyle(
                color: _isSelected ? Colors.white : Colors.black,
                fontSize: SizeConfig.scaledHeight(2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
