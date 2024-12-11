import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/services/auth/auth_service.dart';

class LoginAndRegisterHelper extends ChangeNotifier {
  final authServ = AuthService();

  void login(String email, String password, BuildContext context) {
    try {
      authServ.signInWithEmailAndPassword(email, password);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return SnackBar(content: Text(e.toString()));
        },
      );
    }
  }

  void register(String username, String email, String password, String confirmPassword,
      BuildContext context) async {
    if (password == confirmPassword) {
      try {
        await authServ.signUpUsingEmailAndPassword(username, email, password);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.toString()),
            );
          },
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          content: Text("Passwords Don't Match"),
        ),
      );
    }
  }

  void logout() {
    authServ.signOut();
  }
}
