import 'package:flutter/material.dart';
import 'package:quizeapp/data/question.dart';
import 'package:quizeapp/question_screen.dart';
import 'package:quizeapp/start_screen.dart';
import 'package:quizeapp/results_screen.dart';


class Quiz extends StatefulWidget {
  const Quiz(
      {super.key}); //startQuiz is argument that contain a function as a valuex
    
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
   List<String> _selectedAnsweres=[];
 var activeScreen='start-screen';
  void switchScreen(){
    setState(() {
      activeScreen='questions-screen';
    });
  }
  void choseAnswere(String answere){
    _selectedAnsweres.add(answere);
    if(_selectedAnsweres.length==question.length){
      setState(() {
        activeScreen="results-screen";
      });
    }
  }
  void restartQuiz(){
    setState(() {
      _selectedAnsweres=[];
      activeScreen="question-screen";
    });
  }
  @override
  Widget build(context) {
    Widget screenWidget=StartScreen(switchScreen);
    if(activeScreen=='questions-screen'){
          screenWidget=  QuestionScreen(onSelectAnswere:choseAnswere);
    }
    if(activeScreen=='results-screen'){
      screenWidget= ResultsScreen( chosenAnswers: _selectedAnsweres, onRestart:restartQuiz, );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 78, 16, 185),
            Color.fromARGB(255, 163, 15, 158)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child:screenWidget,
      ),
      ),
    );
  }
}
