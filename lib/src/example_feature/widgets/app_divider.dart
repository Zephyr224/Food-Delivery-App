import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(
          child: Divider(
            indent: 10,
            endIndent: 10,
            color: Colors.grey,
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        const Expanded(
          child: Divider(
            indent: 10,
            endIndent: 10,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
