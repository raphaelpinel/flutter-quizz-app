import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quizz_app/normal_button.dart';
import 'package:quizz_app/questions_summary.dart';
import 'package:quizz_app/quiz_header_text.dart';
import 'questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.selectedAnswers, required this.switchScreen});

  final List<String> selectedAnswers;
  final VoidCallback switchScreen;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].questionText,
        // the correct answer is always the first one
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i],
        'is_correct_answer': questions[i].answers[0] == selectedAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    log('selectedAnswers: $selectedAnswers');
    inspect(questions);
    inspect(summaryData);

    final numberOfTotalQuestions = questions.length;
    final numberOfCorrectAnswers = summaryData.where((data) {
      return data['is_correct_answer'] == true;
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QuizHeaderText(
              'You answered $numberOfCorrectAnswers out of $numberOfTotalQuestions questions correctly!',
            ),
            const SizedBox(height: 16),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            NormalButton(
              onPressed: switchScreen,
              text: 'Restart Quiz',
                icon: Icons.refresh
            ),
          ],
        ),
      ),
    );
  }
}
