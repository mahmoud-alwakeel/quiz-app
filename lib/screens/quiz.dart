import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/results_screen.dart';
import 'package:quiz_app/screens/start_screen.dart';
import 'package:quiz_app/screens/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  String activeScreen = 'start-screen';
  final List<String> choosenAnswersList = [];
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    choosenAnswersList.add(answer);

    if (choosenAnswersList.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
        choosenAnswersList.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Colors.purple,
          child: activeScreen == 'start-screen'
              ? StartScreen(startQuiz: switchScreen)
              : activeScreen == 'result-screen' ? ResultsScreen(choosenAnswers: choosenAnswersList,) 
              : QuestionsScreen(onSelectAnswer: chooseAnswer,) ,
        ),
      ),
    );
  }
}
