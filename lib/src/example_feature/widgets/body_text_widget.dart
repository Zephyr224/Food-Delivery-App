import 'package:flutter/material.dart';

class BodyTextWidget extends StatelessWidget {
  const BodyTextWidget({
    super.key,
    required this.text,
    this.fontSize,
    this.color,
  });

  final String text;
  final double? fontSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: color,
        ),
      ),
    );
  }
}
