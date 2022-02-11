import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final bool isbold;

  const TextWidget({
    Key? key,
    required this.text,
    this.color = Colors.black,
    this.size = 14.0,
    this.isbold = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: isbold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
