import '../model/question_model.dart';

class ScreenArguments {
  const ScreenArguments({
    required this.resetHandler,
    required this.quizQuestions,
    required this.totalScore,
  });

  final void Function() resetHandler;
  final List<QuestionModel> quizQuestions;
  final int totalScore;
}
