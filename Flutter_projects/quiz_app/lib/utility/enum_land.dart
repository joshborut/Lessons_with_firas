enum SoundEffect {
  correct,
  incorrect,
}

extension SeExtension on SoundEffect {
  String get address {
    switch (this) {
      case SoundEffect.correct:
        return "sounds/correct_chime.mp3";
      case SoundEffect.incorrect:
        return "sounds/incorrect_chime.mp3";
      default:
        return "";
    }
  }
}
