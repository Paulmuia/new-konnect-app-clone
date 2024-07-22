import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumberInput extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?) validator;
  final String countryCode;

  const PhoneNumberInput({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.validator,
    this.countryCode = '+254', // Default country code
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          prefix: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(countryCode),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        ),
        keyboardType: TextInputType.phone,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(9), // Limit input to 9 digits
        ],
        validator: validator,
        maxLength: 9,
        buildCounter: (BuildContext context,
            {int? currentLength, int? maxLength, bool? isFocused}) {
          return null; // Hide the counter text
        },
      ),
    );
  }
}
