import 'package:flutter/material.dart';

import 'package:second_app/styled_text.dart';

class StartScreen extends StatelessWidget {

  final void Function() startQuiz;
  
  const StartScreen(this.startQuiz, {super.key});

  
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(124, 255, 255, 255),
          ),
          const SizedBox(
            height: 80,
          ),
          const StyledText('Learn Flutter The The Fun Way!'),
          const SizedBox(
            height: 40,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right),
            label: const StyledText('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
