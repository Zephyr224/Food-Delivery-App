import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/services/service_helpers/login_and_register_helpers.dart';
import 'package:food_delivery_app/main.dart';
import 'package:food_delivery_app/src/example_feature/views/register_page.dart';
import 'package:food_delivery_app/src/example_feature/widgets/alternative_registers_widget.dart';
import 'package:provider/provider.dart';

import '../common/constants.dart';
import '../widgets/app_divider.dart';
import '../widgets/app_text_field.dart';

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
          child: SingleChildScrollView(
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
                    color: Colors.grey
                        .shade600, // TODO: implement initState set in themes
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
                      context.read<LoginAndRegisterHelper>().login(
                          emailController.text,
                          passwordController.text,
                          context);
                    },
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
                Padding(
                  padding: const EdgeInsets.only(left: 280),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ));
                    },
                    child: Text(
                        "Or Register!",
                        style: TextStyle(
                          color: Colors.blue.shade300,
                        ),
                      ),
                  ),
                ),
                const SizedBox(height: 30),
                const AppDivider(text: "Or Login With"),
                const SizedBox(height: 30),
                const AppAlternativeRegistersWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
