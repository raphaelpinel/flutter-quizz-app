import 'package:flutter/material.dart';

class NormalButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const NormalButton({
    required this.text,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: const Icon(
        Icons.play_arrow,
        color: Colors.white,
      ),
      label: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.normal,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
