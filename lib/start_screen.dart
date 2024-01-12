
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen( this.startQuiz,{super.key});
  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Opacity(                            //  it ia also provide trasparancy
          //   opacity:0.5,
          //   child: 
          Image.asset('assets/Images/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(125, 255, 255, 255),),//it is privide transparancy
          const SizedBox(height: 80),
          const Text(
            "learn flutter the fun way!!",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white,backgroundColor: Colors.red),
            icon: const Icon(Icons.start,color: Colors.black,),
            label:  const Text("start Quiz"),
          )
        ],
      ),
    );
  }
}
