import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/widgets/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.choosenAnswers, required this.resetQuiz});

  final List<String> choosenAnswers;
  final void Function() resetQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalAnswerNum = questions.length;
    final correctAnswerNum = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('You answered $correctAnswerNum right out of $totalAnswerNum', style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),),
          const SizedBox(height: 20,),
          QuestionsSummary(summaryData: summaryData,),
          const SizedBox(height: 20,),
          TextButton.icon(
            icon: const Icon(Icons.restart_alt),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.only(top: 20),
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 20,)
            ),
            onPressed: (){
              resetQuiz();
              choosenAnswers.clear();
            }, 
            label: const Text('Restart quiz'))
        ],
      ),
    );
  }
}