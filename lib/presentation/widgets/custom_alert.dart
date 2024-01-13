import 'package:flutter/material.dart';

class CustomAlert extends StatelessWidget {
  final String title;
  final String content;
  final String buttonText;
  final VoidCallback? function;

  CustomAlert({
    required this.title,
    required this.content,
    required this.buttonText,
    this.function,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed:function,
          child: Text(buttonText),
        ),
      ],
    );
  }
}
