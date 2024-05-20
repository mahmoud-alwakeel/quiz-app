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
  final List<String> selectedAnswersList = [];
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswersList.add(answer);

    if (selectedAnswersList.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
        // selectedAnswersList.clear();
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
              : activeScreen == 'result-screen' ? ResultsScreen(choosenAnswers: selectedAnswersList, resetQuiz: switchScreen,) 
              : QuestionsScreen(onSelectAnswer: chooseAnswer,) ,
        ),
      ),
    );
  }
}
