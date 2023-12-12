import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Center(
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
                child: Text(
                  'Learn Flutter the fun way!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(220, 255, 255, 255),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextButton.icon(
                icon: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Add your logic here
                },
                label: const Text(
                  'Start Quiz',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
