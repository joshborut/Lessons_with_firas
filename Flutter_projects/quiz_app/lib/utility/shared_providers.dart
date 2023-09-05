import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedAnswerProvider = StateProvider<String>((ref) => "");

final selectedAnsAccuracyProvider = StateProvider<int>((ref) => 0);

final mistakeAttemptsProvider = StateProvider<int>((ref) => 4);

final resultScrnMsgProvider = StateProvider<String>((ref) => "");

final incorrectPlayerProvider = StateProvider<AudioPlayer?>((ref) => null);

final correctPlayerProvider = StateProvider<AudioPlayer?>((ref) => null);
