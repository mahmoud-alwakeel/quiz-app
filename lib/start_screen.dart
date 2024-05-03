import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 200,
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Let\'s Learn flutter the fun way',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          TextButton.icon(
            onPressed: startQuiz,
                style: TextButton.styleFrom(
                padding: const EdgeInsets.only(top: 20),
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 20)),
            icon: const Icon(Icons.arrow_forward_outlined),
            label: const Text('Start Quiz'),
          )
        ],
      ),
    );
  }
}
