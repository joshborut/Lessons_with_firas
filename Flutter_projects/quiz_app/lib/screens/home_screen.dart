import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/utility/enum_land.dart';

import '../model/question_model.dart';
import '../model/screen_arguments.dart';
import '../utility/shared_providers.dart';
import '../utility/home_functions.dart';
import '../utility/size_config.dart';
import '../widgets/choice_option.dart';
import '../widgets/text_container.dart';
import '../widgets/gesture_container.dart';
import '../widgets/gradient_container.dart';
import '../widgets/home_top_section.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
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
    initializeAudioPlayers(ref);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!SizeConfig.initialized) {
      SizeConfig(context);
    }
    super.didChangeDependencies();
  }

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIdx = 0;
    });
    ref.read(mistakeAttemptsProvider.notifier).state = 4;
    ref.read(selectedAnswerProvider.notifier).state = "";
    Navigator.of(context).pop();
  }

  void _navToResultScrn(String msg) {
    ref.read(resultScrnMsgProvider.notifier).state = msg;
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

  void _answerClicked() {
    final accuracy = ref.read(selectedAnsAccuracyProvider);
    final mistakes = ref.read(mistakeAttemptsProvider);
    // Prevents overlapping audio
    stopPlayingSound(ref);
    if (accuracy == 0) {
      // Incorrect choice
      startPlayingSound(ref, SoundEffect.incorrect);
      ref.read(mistakeAttemptsProvider.notifier).state = mistakes - 1;
      if (mistakes <= 1) {
        _navToResultScrn(
            "Game over. You reached question ${_questionIdx + 1}!");
      }
    } else {
      // Correct choice
      startPlayingSound(ref, SoundEffect.correct);
      if (_questionIdx < questionList.length - 1) {
        ref.read(selectedAnswerProvider.notifier).state = "";
        setState(() => _questionIdx++);
      } else {
        _navToResultScrn("Congratulations! You are a quiz master!");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // final List<Map<String, dynamic>> answers =
    //     AppConstants.questions[_questionIdx]["answers"];
    final currentQuestion = questionList[_questionIdx];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Question #${_questionIdx + 1}",
        ),
      ),
      body: GradientContainer(
        childWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HomeTopSection(
              numOfQuestions: questionList.length,
              questionIdx: _questionIdx,
            ),
            // Question(questionText: AppConstants.questions[_questionIdx]["text"]),
            TextContainer(textToShow: currentQuestion.qusTxt),
            Spacer(),
            // ... is called the spread operator and splits
            // a list of widgets into individual widgets
            ...currentQuestion.ansList
                .map((e) => ChoiceOption(
                      answerText: e.ansTxt,
                      accuracy: e.accuracy,
                    ))
                .toList(),
            Spacer(),
            GestureContainer(
              passedFunction: _answerClicked,
              textToShow: "Submit",
            ),
            Spacer(
              flex: 3,
            )
          ],
        ),
      ),
    );
  }
}
