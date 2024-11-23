import 'package:flutter/material.dart';

import '../common/constants.dart';
import '../widgets/alternative_login_widget.dart';
import '../widgets/app_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // instantiate text controllers
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  // instantiate text controllers
  late FocusNode focusNode;

  @override
  void initState() {
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    focusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    confirmPasswordController.dispose();

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
            "Register",
            style: TextStyle(
              fontSize: pageHeaderFontSize,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextField(
                controller: usernameController,
                labelText: "Username",
                textInputType: TextInputType.text,
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors
                      .grey.shade600, // TODO: implement initState set in themes
                ),
              ),
              const SizedBox(height: 30),
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
              const SizedBox(height: 30),
              AppTextField(
                controller: confirmPasswordController,
                labelText: "Confirm Password",
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
                      )),
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
