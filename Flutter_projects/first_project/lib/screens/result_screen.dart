import 'package:first_project/app_constants.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  String resultPhrase(int score) {
    if (score == AppConstants.questions.length) {
      return "You have answered all questions correctly!";
    } else {
      return "You have answered $score/"
          "${AppConstants.questions.length} correctly";
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Result Screen",
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            resultPhrase(args[1]),
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              fontFamily: "Lato",
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 100,
            width: double.infinity,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[300],
            ),
            onPressed: args[0],
            child: Text(
              "Restart Quiz",
              style: TextStyle(
                fontSize: 20,
                color: Colors.lightBlue[300],
              ),
            ),
          )
        ],
      ),
    );
  }
}
