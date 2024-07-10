import 'package:flutter/material.dart';


class DropdownButtonFormFieldWithMargin extends StatelessWidget {
  final String? value;
  final String labelText;
  final List<String> items;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;

  const DropdownButtonFormFieldWithMargin({
    Key? key,
    required this.value,
    required this.labelText,
    required this.items,
    required this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 300), // Set your desired width here
        child: DropdownButtonFormField<String>(
          value: value,
          onChanged: onChanged,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            labelText: labelText,
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          ),
          validator: validator,
        ),
      ),
    );
  }
}

