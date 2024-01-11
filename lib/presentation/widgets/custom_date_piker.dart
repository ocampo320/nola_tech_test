import 'package:flutter/material.dart';

class CustomDatePicker extends StatefulWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateChanged;

  CustomDatePicker({
    required this.selectedDate,
    required this.onDateChanged,
  });

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != widget.selectedDate) {
      widget.onDateChanged(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Text(
          'Fecha seleccionada:',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(width: 10),
        Text(
          '${widget.selectedDate.toLocal()}'.split(' ')[0],
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          onPressed: () => _selectDate(context),
          child: const Text('Seleccionar Fecha'),
        ),
      ],
    );
  }
}
