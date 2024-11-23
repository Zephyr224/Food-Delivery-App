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
      child: Container(
        height: 70,
        width: 175,        
        padding: const EdgeInsets.all(10),        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white10,
          border: Border.all(
            width: 0.1
          ),
        ),
        child: Image.asset(assetPath),
      ),
    );
  }
}
