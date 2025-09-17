class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers); // Hacemos una copia de la lista
    shuffledList.shuffle();// Barjamos el orden de los elementos de la lista
    return shuffledList; // Devolvemos la lista
  }
}