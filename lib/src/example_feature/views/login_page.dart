import 'package:flutter/material.dart';

import '../common/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;

  @override
  void initState() {
    emailController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login",
              style: TextStyle(
                fontSize: pageHeaderFontSize,
              ),
            ),
            const SizedBox(height: 20),
            AppTextField(
              controller: emailController,
              labelText: "Email",
              textInputType: TextInputType.emailAddress,
              suffixIcon: Icon(
                Icons.email,
                color: Colors
                    .grey.shade600, // TODO: implement initState set in themes
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.suffixIcon,
    required this.labelText,
    this.textInputType = TextInputType.none,
    this.obscure = false,
  });

  final TextEditingController controller;
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
            suffixIcon: suffixIcon,
            labelText: labelText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(textFieldRadius),
              borderSide: BorderSide.none
            ),
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
