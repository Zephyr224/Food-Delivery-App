import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/services/auth/auth_service.dart';

class LoginAndRegisterHelper extends ChangeNotifier {
  final authServ = AuthService();
  String userEmail = "Loading...";

  void currentUserEmail() {
    userEmail = authServ.getCurrentUserEmail().toString();
  }

  void login(String email, String password, BuildContext context) {
    try {
      authServ.signInWithEmailAndPassword(email, password);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(content: Text(e.toString()));
        },
      );
    }
  }

  void register(String username, String email, String password, String confirmPassword,
      BuildContext context) async {
    if (password == confirmPassword) {
      try {
        await authServ.signUpUsingEmailAndPassword(username, email, password);
        debugPrint("Registered Successfully");
      } catch (e) {
        showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (context) {
            
        debugPrint("Unsuccessful. Exception Caught!");
            return AlertDialog(
              content: Text(e.toString()),
            );
          },
        );
      }
    } else {
      debugPrint("Unsuccessful. Passwords don't match!");
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
