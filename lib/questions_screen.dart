import 'package:flutter/material.dart';
import 'package:quizz_app/answer_button.dart';
import 'package:quizz_app/quiz_header_text.dart';
import 'questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(
      {super.key,
      required this.onSelectAnswer,
      required this.currentQuestionIndex});

  final void Function(String answer) onSelectAnswer;
  final int currentQuestionIndex;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.currentQuestionIndex < questions.length
        ? questions[widget.currentQuestionIndex]
        : null;
    
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            QuizHeaderText(currentQuestion!.questionText),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map(
                  (answer) => AnswerButton(
                    answerText: answer,
                    onPressed: () {
                      answerQuestion(answer);
                    },
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
