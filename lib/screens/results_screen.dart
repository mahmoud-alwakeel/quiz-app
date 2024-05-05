import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.choosenAnswers});

  final List<String> choosenAnswers;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.8,
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('ans'),
          const SizedBox(height: 20,),
          ListView(),
          const SizedBox(height: 20,),
          TextButton.icon(
            icon: const Icon(Icons.restart_alt),
            onPressed: (){}, label: Text('btn'))
        ],
      ),
    );
  }
}