import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer({
    required this.answerText,
    required this.selectHan,
    super.key,
  });

  final String answerText;
  final void Function() selectHan;

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
        onPressed: selectHan,
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
