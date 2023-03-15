import 'package:first_project/model/screen_arguments.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  String resultPhrase(int totalScore, questionList) {
    if (totalScore == questionList.length) {
      return "You have answered all questions correctly!";
    } else {
      return "You have answered $totalScore/"
          "${questionList.length} correctly";
    }
  }

  @override
  Widget build(BuildContext context) {
    final scrnArgs =
        ModalRoute.of(context)!.settings.arguments as ScreenArguments;
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
            resultPhrase(scrnArgs.totalScore, scrnArgs.quizQuestions),
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
            onPressed: scrnArgs.resetHandler,
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
