import 'package:flutter/material.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    super.key,
    required this.question,
    required this.isSelected,
    required this.currentIndex,
    required this.correctAnswerIndex,
    required this.selectedAnswerIndex,
  });

  final String question;
  final bool isSelected;
  final int? correctAnswerIndex;
  final int? selectedAnswerIndex;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    bool isCorrectAnswer = currentIndex == correctAnswerIndex;
    bool isWrongAnswer = !isCorrectAnswer && isSelected;
    return selectedAnswerIndex != null
        ? Card(
            color: isCorrectAnswer
                ? Colors.green
                : isWrongAnswer
                    ? Colors.red
                    : Colors.white,
            child: ListTile(
              title: Text(
                question,
                style: const TextStyle(),
              ),
            ),
          )

        // If no option is selected
        : Card(
            color: Colors.white,
            child: ListTile(
              title: Text(
                question,
                style: const TextStyle(),
              ),
              // onTap: (){
              //   print('tap');
              // },
            ),
          );
  }
}
