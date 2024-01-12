import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onPressed;

  const CustomCard({super.key, 
    required this.title,
    required this.content,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0, // Sombra de la tarjeta
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          ListTile(
            title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(content),
          ),
          ButtonBar(
            children: [
              TextButton(
                onPressed: onPressed,
                child: const Text('Acción'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
