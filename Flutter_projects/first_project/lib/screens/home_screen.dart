import 'package:first_project/model/question_model.dart';
import 'package:first_project/model/screen_arguments.dart';
import 'package:first_project/utility/home_functions.dart';
import 'package:first_project/widgets/answer.dart';
import 'package:first_project/widgets/question.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late final means that the data will be intialized eventually,
  // and once it is initalized, it can never change.
  late final List<QuestionModel> questionList;
  int _questionIdx = 0;
  int _totalScore = 0;

// initState() is called when the widget is first created.
// initState() is never called again afterwards.
  @override
  void initState() {
    questionList = getQuizQuestions();
    super.initState();
  }

  void _resetQuiz() {
    Navigator.of(context).pop();
    setState(() {
      _totalScore = 0;
      _questionIdx = 0;
    });
  }

  void _answerClicked(int score) {
    _totalScore += score;
    setState(() {
      if (_questionIdx < questionList.length - 1) {
        _questionIdx++;
      } else {
        Navigator.of(context).pushNamed(
          "/result-screen",
          // arguments: [_resetQuiz, _totalScore, questionList],
          arguments: ScreenArguments(
            resetHandler: _resetQuiz,
            quizQuestions: questionList,
            totalScore: _totalScore,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // final List<Map<String, dynamic>> answers =
    //     AppConstants.questions[_questionIdx]["answers"];
    final currentQuestion = questionList[_questionIdx];
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
          // Question(questionText: AppConstants.questions[_questionIdx]["text"]),
          Question(questionText: currentQuestion.qusTxt),
          const SizedBox(
            height: 20,
          ),
          // ... is called the spread operator and splits
          // a list of widgets into individual widgets
          ...currentQuestion.ansList
              .map((e) => Answer(
                    answerText: e.ansTxt,
                    answerClicked: _answerClicked,
                    accuracy: e.accuracy,
                  ))
              .toList(),
        ],
      ),
    );
  }
}
