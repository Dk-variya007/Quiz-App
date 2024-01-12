class QuizQuestion{
  QuizQuestion(this.text,this.answers);
  
  final String text;
  final List<String>answers;
  List<String> getShuffledAnswers(){
    final shuffledlist=List.of(answers); // of use to create new list of answerlist
    shuffledlist.shuffle();
    return shuffledlist;
  }
}