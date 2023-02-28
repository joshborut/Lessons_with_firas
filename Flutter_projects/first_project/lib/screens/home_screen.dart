import 'package:first_project/widgets/answer.dart';
import 'package:first_project/widgets/question.dart';
import 'package:flutter/material.dart';

import '../app_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _questionIdx = 0;

  void _answerClicked() {
    setState(() {
      if (_questionIdx < AppConstants.questions.length - 1) {
        _questionIdx++;
      } else {
        Navigator.of(context).pushNamed("/result-screen");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> answers =
        AppConstants.questions[_questionIdx]["answers"];
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Starter App",
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Question(questionText: AppConstants.questions[_questionIdx]["text"]),
          const SizedBox(
            height: 20,
          ),
          // Answer(answerText: AppConstants.questions[0]["answers"][0]["ans"])
          // ... is called the spread operator and splits
          // a list of widgets into individual widgets
          ...answers
              .map((e) => Answer(
                    answerText: e["ans"],
                    selectHan: _answerClicked,
                  ))
              .toList(),
        ],
      ),
    );
  }
}
