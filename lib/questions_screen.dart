import 'package:flutter/material.dart';
import 'package:quizz_app/answer_button.dart';
import 'package:quizz_app/quiz_header_text.dart';
import 'questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  var score = 0;

  void _incrementQuestionIndex() {
    setState(() {
      currentQuestionIndex++;
    });
  }

  void setScore(int newScore) {
    setState(() {
      score = newScore;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = currentQuestionIndex < questions.length
        ? questions[currentQuestionIndex]
        : null;
    List<Widget> content = currentQuestionIndex < questions.length
        ? [
            QuizHeaderText(currentQuestion!.questionText),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map(
                  (answer) => AnswerButton(
                    onPressed: () {
                      _incrementQuestionIndex();
                      if (answer == currentQuestion.answers[0]) {
                        setScore(score + 1);
                      }
                    },
                    answerText: answer,
                  ),
                ),
          ]
        : [
            const QuizHeaderText(
              'You have completed the quiz!',
            ),
            Text(
              'Your score is: $score/${questions.length}',
              style: const TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            AnswerButton(
              onPressed: () {
                setState(() {
                  currentQuestionIndex = 0;
                  score = 0;
                });
              },
              answerText: 'Restart Quiz',
            ),
          ];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: content,
        ),
      ),
    );
  }
}
