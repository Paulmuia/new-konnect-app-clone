import 'package:flutter/material.dart';

class RowTexts extends StatelessWidget {
  final String text;
  final String text1;
  const RowTexts({super.key, required this.text, required this.text1});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
        Text(text1,style: const TextStyle(fontWeight: FontWeight.w300,fontSize: 15),)
      ],
    );
  }
}