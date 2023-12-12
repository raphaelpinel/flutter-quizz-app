import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(children: [
        Text('Question 1'),
        Text('Question 2'),
        Text('Question 3'),
        Text('Question 4'),
        Text('Question 5'),
        Text('Question 6'),
        Text('Question 7'),
        Text('Question 8'),
        Text('Question 9'),
        Text('Question 10'),
      ]),
    );
  }
}
