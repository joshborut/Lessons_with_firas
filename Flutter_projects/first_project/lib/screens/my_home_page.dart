import 'package:first_project/widgets/answer.dart';
import 'package:first_project/widgets/question.dart';
import 'package:flutter/material.dart';

import '../app_constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int questionIdx = 0;

  void answerClicked() {
    setState(() {
      if (questionIdx < AppConstants.questions.length - 1) questionIdx++;
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
