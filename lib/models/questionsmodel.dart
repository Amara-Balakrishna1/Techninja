class Questionsmodel {
  final String question, orginalAnswer;
  String selectedAnswer;
  final List<dynamic> options;
  Questionsmodel(
      this.question, this.selectedAnswer, this.orginalAnswer, this.options);
}
