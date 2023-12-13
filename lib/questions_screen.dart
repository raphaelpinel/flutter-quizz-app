import 'package:flutter/material.dart';
import 'package:quizz_app/answer_button.dart';
import 'questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[0];
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(children: [
            Text(
              currentQuestion.questionText,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              itemCount: currentQuestion.answers.length,
              itemBuilder: (context, index) {
                final answer = currentQuestion.answers[index];
                return AnswerButton(
                  onPressed: () {},
                  answerText: answer,
                );
              },
            ),
          ]
              // questions.map((question) => Text(question.toString())).toList(),
              ),
          // END: be15d9bcejpp
        ],
      ),
    );
  }
}
