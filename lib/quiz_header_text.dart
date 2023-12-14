import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizHeaderText extends StatelessWidget {
  const QuizHeaderText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.lato(
        textStyle: const TextStyle(
          color: Color.fromARGB(255, 210, 192, 220),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
