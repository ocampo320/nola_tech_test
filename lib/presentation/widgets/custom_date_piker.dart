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
  late TextEditingController _dateController;

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController(
      text: '${widget.selectedDate.toLocal()}'.split(' ')[0],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != widget.selectedDate) {
      widget.onDateChanged(picked);
      _dateController.text = '${picked.toLocal()}'.split(' ')[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Row(
        children: <Widget>[
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _dateController,
              readOnly: true,
              onTap: () => _selectDate(context),
              decoration:
                  const InputDecoration(prefixIcon: Icon(Icons.date_range_outlined)),
            ),
          ),
        ],
      ),
    );
  }
}
