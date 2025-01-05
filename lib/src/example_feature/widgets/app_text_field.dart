import 'package:flutter/material.dart';

import '../common/constants.dart';

class AppTextField extends StatefulWidget {
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
  final IconButton? suffixIcon;
  final TextInputType? textInputType;
  final String labelText;
  final bool obscure;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 12,
      color: Colors.white70,
      borderRadius: BorderRadius.circular(textFieldRadius),
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.textInputType,
        obscureText: widget.obscure,
        style: const TextStyle(
          height: 3,
        ),
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          suffix: widget.suffixIcon,
          labelText: widget.labelText,
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
    );
  }
}