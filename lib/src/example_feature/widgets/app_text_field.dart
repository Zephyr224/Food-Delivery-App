import 'package:flutter/material.dart';

import '../common/constants.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.prefixIcon,
    required this.labelText,
    this.textInputType = TextInputType.none,
    this.obscure = false,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final TextInputType? textInputType;
  final String labelText;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: textFieldPadding),
      child: Material(
        elevation: 12,
        color: Colors.white70,
        borderRadius: BorderRadius.circular(textFieldRadius),
        child: TextField(
          controller: controller,
          keyboardType: textInputType,
          obscureText: obscure,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffix: suffixIcon,
            labelText: labelText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(textFieldRadius),
                borderSide: BorderSide.none),
            focusColor: const Color.fromARGB(255, 25, 99, 209), // in themes
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red.shade900),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red.shade900),
            ),
          ),
        ),
      ),
    );
  }
}