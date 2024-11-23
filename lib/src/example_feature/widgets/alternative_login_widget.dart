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
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
        ),
        onPressed: () {},
        child: SizedBox(
          height: 50,
          width: 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(assetPath),
          ),
        ),
      ),
    );
  }
}
