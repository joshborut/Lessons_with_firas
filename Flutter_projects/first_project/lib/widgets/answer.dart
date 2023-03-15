import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer({
    required this.answerText,
    required this.answerClicked,
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
  final void Function(int) answerClicked;
  final int accuracy;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[300],
        ),
        onPressed: () => answerClicked(accuracy),
        child: Text(
          answerText,
          style: TextStyle(
            color: Colors.lightBlue[300],
          ),
        ),
      ),
    );
  }
}
