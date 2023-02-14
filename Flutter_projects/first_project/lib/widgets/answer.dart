import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer({required this.answerText, super.key});

  final String answerText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: null,
        child: Text(
          answerText,
          style: const TextStyle(
            color: Colors.lightBlue,
          ),
        ),
      ),
    );
  }
}
