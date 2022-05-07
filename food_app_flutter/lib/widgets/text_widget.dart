import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText({
    Key? key,
    required this.text,
    this.isBold = false,
    this.size = 16,
    this.textAlign = TextAlign.start,
    this.color = Colors.black87,
  }) : super(key: key);

  final String text;
  final bool isBold;
  final double size;
  final TextAlign textAlign;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
