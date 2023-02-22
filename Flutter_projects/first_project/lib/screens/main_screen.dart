import 'package:first_project/widgets/answer.dart';
import 'package:first_project/widgets/question.dart';
import 'package:flutter/material.dart';

import '../app_constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int questionIdx = 0;

  void answerClicked() {
    setState(() {
      if (questionIdx < AppConstants.questions.length - 1) {
        questionIdx++;
      } else {
        Navigator.of(context).pushNamed("/result-screen");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> answers =
        AppConstants.questions[questionIdx]["answers"];
    return Scaffold(
      appBar: AppBar(
        title: const SizedBox(
          width: double.infinity,
          child: Text(
            "Starter App",
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Question(questionText: AppConstants.questions[questionIdx]["text"]),
          const SizedBox(
            height: 20,
          ),
          // Answer(answerText: AppConstants.questions[0]["answers"][0]["ans"])
          // ... is called the spread operator and splits
          // a list of widgets into individual widgets
          ...answers
              .map((e) => Answer(
                    answerText: e["ans"],
                    selectHan: answerClicked,
                  ))
              .toList(),
        ],
      ),
    );
  }
}