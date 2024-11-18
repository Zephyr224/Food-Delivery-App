import 'package:flutter/material.dart';

import '../common/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // instantiate text controllers
  late TextEditingController emailController;
  late TextEditingController passwordController;

  // instantiate text controllers
  late FocusNode focusNode;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    focusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();

    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        focusNode.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            "Login",
            style: TextStyle(
              fontSize: pageHeaderFontSize,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              AppTextField(
                controller: emailController,
                labelText: "Email",
                textInputType: TextInputType.emailAddress,
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors
                      .grey.shade600, // TODO: implement initState set in themes
                ),
              ),
              const SizedBox(height: 30),
              AppTextField(
                controller: passwordController,
                labelText: "Password",
                textInputType: TextInputType.text,
                obscure: true,
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors
                      .grey.shade600, // TODO: implement initState set in themes
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 230),
                child: Text("Forgot Password?"),
              ),
              const SizedBox(height: 50),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 8,
                    backgroundColor: Colors.blueGrey.shade500,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )
                  ),
                  child: const Text("Login"),
                ),
              ),
              const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Divider(
                        indent: 10,
                        endIndent: 10,
                      ),
                    ),
                    Text("Or Login With"),
                    Expanded(
                      child: Divider(
                        indent: 10,
                        endIndent: 10,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AlternativeLoginWidget(
                      assetPath: "assets/images/facebook.png",
                      onTap: () {},
                    ),
                    const SizedBox(width: 20),
                    AlternativeLoginWidget(
                      assetPath: "assets/images/google.png",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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

// ignore: must_be_immutable
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
