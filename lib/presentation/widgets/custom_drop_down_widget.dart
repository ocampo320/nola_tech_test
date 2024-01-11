import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final String selectedItem;
  final ValueChanged<String?> onItemSelected;

  CustomDropdown({
    required this.items,
    required this.selectedItem,
    required this.onItemSelected,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.selectedItem,
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
          DropdownButton<String>(
            value: widget.selectedItem,
            onChanged: (String? value) {
              widget.onItemSelected(value);
            },
            items: widget.items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            icon: const Icon(Icons.arrow_drop_down, size: 24.0, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
