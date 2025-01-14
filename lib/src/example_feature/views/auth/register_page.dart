import 'package:flutter/material.dart';
import 'package:food_delivery_app/src/example_feature/widgets/app_divider.dart';

import '../../common/constants.dart';
import '../../widgets/alternative_login_widgets.dart';
import '../../widgets/app_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage(
      {super.key, required this.register, required this.context1});

  final Function(String, String, String, String, BuildContext) register;
  final BuildContext context1;

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

  bool passwordVisible = true;

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: customSafeArea),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTextField(
                    controller: usernameController,
                    labelText: "Username",
                    textInputType: TextInputType.text,
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.grey
                          .shade600, // TODO: implement initState set in themes
                    ),
                  ),
                  const SizedBox(height: 30),
                  AppTextField(
                    controller: emailController,
                    labelText: "Email",
                    textInputType: TextInputType.emailAddress,
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.grey
                          .shade600, // TODO: implement initState set in themes
                    ),
                  ),
                  const SizedBox(height: 30),
                  AppTextField(
                    controller: passwordController,
                    labelText: "Password",
                    textInputType: TextInputType.text,
                    obscure: passwordVisible,
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        }, // obscure listen to provider class, when icon button pressed, change that value
                        icon: Icon(
                          passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey.shade600,
                        )),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.grey
                          .shade600, // TODO: implement initState set in themes
                    ),
                  ),
                  const SizedBox(height: 30),
                  AppTextField(
                    controller: confirmPasswordController,
                    labelText: "Confirm Password",
                    textInputType: TextInputType.text,
                    obscure: passwordVisible,
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        }, // obscure listen to provider class, when icon button pressed, change that value
                        icon: Icon(
                          passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey.shade600,
                        )),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.grey
                          .shade600, // TODO: implement initState set in themes
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
                      onPressed: () {
                        widget.register(
                          usernameController.text,
                          emailController.text,
                          passwordController.text,
                          confirmPasswordController.text,
                          widget.context1,
                        );
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 8,
                          backgroundColor: Colors.blueGrey.shade500,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                      child: const Text("Register"),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const AppDivider(text: "Or Register With"),
                  const SizedBox(height: 30),
                  const AppAlternativeLoginWidges(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
