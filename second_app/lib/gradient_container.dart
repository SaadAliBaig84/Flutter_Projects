import 'package:flutter/material.dart';
import 'package:second_app/data/questions.dart';
import 'package:second_app/questions.dart';
import 'package:second_app/start_screen.dart';
import 'package:second_app/result_screen.dart';

class GradientContainer extends StatefulWidget {
  final List<Color> colorArg;
  const GradientContainer(this.colorArg, {super.key});
  @override
  State<GradientContainer> createState() {
    return _GradientContainerState(colorArg);
  }
}

class _GradientContainerState extends State<GradientContainer> {
  final List<String> chosenAnswers = [];
  String activeScreen = 'startScreen';
  // void initState() {
  //   activeScreen = 'questionsScreen';
  //   super.initState();
  // }
  void chooseAnswer(String answer) {
    chosenAnswers.add(answer);
    if (chosenAnswers.length == questions.length) {
      setState(() {
        //chosenAnswers.clear();
        activeScreen = 'resultScreen';
      });
    }
  }

  void startQuiz() {
    setState(() {
      activeScreen = 'questionsScreen';
    });
  }

  List<Color> colorArg = const <Color>[
    Color.fromARGB(255, 92, 46, 170),
    Color.fromARGB(255, 113, 70, 187),
  ];
  _GradientContainerState(this.colorArg);

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(startQuiz);

    if (activeScreen == 'questionsScreen') {
      screenWidget = Questions(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'resultScreen') {
      screenWidget = ResultScreen(
        endQuiz: () {
          setState(() {
            chosenAnswers.clear(); 
            activeScreen = 'questionsScreen';
          });
        },
        chosenAnswers: chosenAnswers,
      );
    }
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colorArg,
        ),
      ),
      child: Center(
        child: screenWidget,
      ),
    );
  }
}
