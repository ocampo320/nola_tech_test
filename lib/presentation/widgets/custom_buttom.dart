import 'package:flutter/material.dart';
import 'package:test_flutter_dev/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
  style: ElevatedButton.styleFrom(
    primary: AppColors.accentColor,
    onPrimary: Colors.white, // Puedes ajustar el color del texto según tus necesidades
  ),
  onPressed: onPressed,
  child: Text(text),
)
;
  }
}
