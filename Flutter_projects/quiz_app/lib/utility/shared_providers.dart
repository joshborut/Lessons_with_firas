import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedAnswerProvider = StateProvider<String>((ref) => "");

final selectedAnsAccuracyProvider = StateProvider<int>((ref) => 0);

final mistakeAttemptsProvider = StateProvider<int>((ref) => 4);
