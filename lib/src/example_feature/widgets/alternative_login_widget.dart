import 'package:flutter/material.dart';

class AlternativeLoginWidget extends StatelessWidget {
  const AlternativeLoginWidget({
    super.key,
    required this.assetPath,
    required this.onTap,
  });

  final String assetPath;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 70,
        width: 70,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(70),
          child: Image.asset(assetPath),
        ),
      ),
    );
  }
}