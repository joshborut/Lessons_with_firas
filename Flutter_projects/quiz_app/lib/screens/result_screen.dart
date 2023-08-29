import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/screen_arguments.dart';
import '../utility/shared_providers.dart';
import '../utility/size_config.dart';
import '../widgets/gesture_container.dart';
import '../widgets/gradient_container.dart';
import '../widgets/text_container.dart';

class ResultScreen extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final scrnMsg = ref.watch(resultScrnMsgProvider);
    final scrnArgs =
        ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Result Screen",
        ),
      ),
      body: GradientContainer(
        childWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextContainer(
              textToShow: scrnMsg,
              // resultPhrase(scrnArgs.totalScore, scrnArgs.quizQuestions),
            ),
            SizedBox(
              height: SizeConfig.scaledHeight(5),
              width: double.infinity,
            ),
            GestureContainer(
              passedFunction: scrnArgs.resetHandler,
              textToShow: "Restart Quiz",
            ),
          ],
        ),
      ),
    );
  }
}
