import 'package:flutter/material.dart';

class CustomAlert extends StatelessWidget {
  final String title;
  final String content;
  final String buttonText;

  CustomAlert({
    required this.title,
    required this.content,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Cerrar la alerta al hacer clic en el botón
          },
          child: Text(buttonText),
        ),
      ],
    );
  }
}
