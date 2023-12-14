import 'package:flutter/material.dart';
import 'package:quizz_app/models/screen_name.enum.dart';
import 'package:quizz_app/questions.dart';
import 'package:quizz_app/questions_screen.dart';
import 'package:quizz_app/results_screen.dart';
import 'package:quizz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];
  var currentQuestionIndex = 0;
  var activeScreen = ScreenName.startScreen;

  void switchScreen() {
    setState(() {
      activeScreen = ScreenName.questionsScreen;
    });
  }

  void chooseAnswer(String answer) {
    setState(() {
      selectedAnswers.add(answer);
      currentQuestionIndex++;
    });

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ScreenName.resultsScreen;
      });
    }
  }

  @override
  
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == ScreenName.questionsScreen) {
      screenWidget = QuestionsScreen(
          onSelectAnswer: chooseAnswer,
          currentQuestionIndex: currentQuestionIndex);
    }
    if (activeScreen == ScreenName.resultsScreen) {
      screenWidget = ResultsScreen(
        selectedAnswers: selectedAnswers,
        switchScreen: () {
          setState(() {
            switchScreen();
            selectedAnswers.clear();
            currentQuestionIndex = 0;
          });
        },
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 64, 5, 87), // Deep purple
                Color.fromARGB(255, 115, 8, 161), // Lighter purple
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
