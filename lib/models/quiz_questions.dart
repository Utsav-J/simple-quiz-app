class QuizQuestion {
  const QuizQuestion(this.questionText, this.answers);

  final String questionText;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final List<String> shuffledList =
        List.of(answers); // final only means that we cant REASSIGN
    shuffledList.shuffle(); // inplace shuffled
    return shuffledList;
    //calling the shuffle to the copy of new list of answers
  }
}
