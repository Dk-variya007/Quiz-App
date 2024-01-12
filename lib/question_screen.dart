import 'package:flutter/material.dart';
import 'package:quizeapp/answere_button.dart';
import 'package:quizeapp/data/question.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswere});
  final void Function(String answere) onSelectAnswere;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnsweres) {
    widget.onSelectAnswere(selectedAnsweres);
    currentQuestionIndex++;
    setState(() {});
  }

  @override
  Widget build(context) {
    final currentQuestion = question[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQuestion.text,
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
                textAlign: TextAlign.center),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswers().map((answere) {
              // ... is spreading values(...)
              return AnswereButton(
                  answereText: answere,
                  onTap: () {
                    answerQuestion(answere);
                  });
            })
          ],
        ),
      ),
    );
  }
}
