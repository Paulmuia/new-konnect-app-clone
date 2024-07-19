import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;
  final String text;

  const IconText({
    Key? key,
    required this.icon,
    required this.color,
    required this.size,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
          size: size,
        ),
        SizedBox(width: 5), // Spacing between icon and text
        Text(
          text,
          style: TextStyle(fontSize: size * 0.75), // Adjust text size as needed
        ),
      ],
    );
  }
}
