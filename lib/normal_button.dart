import 'package:flutter/material.dart';

class NormalButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final IconData? icon;

  const NormalButton({
    required this.text,
    this.onPressed,
    this.icon = Icons.play_arrow,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: Icon(
        icon,
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
