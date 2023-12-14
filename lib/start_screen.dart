import 'package:flutter/material.dart';
import 'package:quizz_app/normal_button.dart';
import 'package:quizz_app/quiz_header_text.dart';

class StartScreen extends StatelessWidget {
  final void Function() switchScreen;

  const StartScreen(
    this.switchScreen, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(
            // maxWidth: 200,
            ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 250,
              color: const Color.fromARGB(150, 255, 255, 255),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 40),
              child: QuizHeaderText(
                'Learn Flutter the fun way!',
              ),
            ),
            const SizedBox(height: 20),
            NormalButton(text: 'Start Quiz', onPressed: switchScreen),
          ],
        ),
      ),
    );
  }
}
