import 'package:flutter/material.dart';
import 'package:second_app/gradient_container.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(context) {
    return const MaterialApp(
      home: Scaffold(
        body: GradientContainer(<Color>[
          Color.fromARGB(255, 92, 46, 170),
          Color.fromARGB(255, 113, 70, 187),
        ]),
      ),
    );
  }
}
