import 'package:flutter/material.dart';
import 'package:quizz_app/enums/screenName.enum.dart';
import 'package:quizz_app/questions_screen.dart';
import 'package:quizz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = ScreenName.startScreen;

  void switchScreen() {
    setState(() {
      activeScreen = ScreenName.questionsScreen;
    });
  }

  @override
  
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == ScreenName.questionsScreen) {
      screenWidget = const QuestionsScreen();
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
