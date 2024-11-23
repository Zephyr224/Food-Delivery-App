import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Divider(
              indent: 10,
              endIndent: 10,
            ),
          ),
          Text(text),
          const Expanded(
            child: Divider(
              indent: 10,
              endIndent: 10,
            ),
          ),
        ],
      ),
    );
  }
}