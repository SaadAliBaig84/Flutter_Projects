class QuizQuestion {
  const QuizQuestion(this.question, this.answers);
  final String question;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final copyList = List.of(answers);
    copyList.shuffle();
    return copyList;
  }
}
