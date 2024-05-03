class QuizQuestion {
  final String question;
  final List<String> answers;

  const QuizQuestion({required this.question, required this.answers});

  List<String> shuffleAnswers() {
    final shuffled = List.of(answers);
    shuffled.shuffle();
    return shuffled;
  }
}
