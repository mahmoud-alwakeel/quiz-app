
import 'package:flutter/material.dart';

class CustomAnswerButton extends StatelessWidget {

  final void Function() onPressed;
  final String answerText;

  const CustomAnswerButton({super.key, required this.onPressed, required this.answerText,});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed, 
      style: TextButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.indigo),
      child: Text(answerText, textAlign: TextAlign.center,));
  }
}