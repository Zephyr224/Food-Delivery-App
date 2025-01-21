import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/services/auth/auth_service.dart';

class LoginAndRegisterHelper extends ChangeNotifier {
  final authServ = AuthService();
  String userEmail = "Loading...";

  void currentUserEmail() async {
    userEmail = await authServ.getCurrentUserEmail();
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
          debugPrint("Registering...");
      if (password == confirmPassword) {
        try {
          await authServ.signUpUsingEmailAndPassword(username, email, password);
          debugPrint("Registered Successfully");
        } on Exception catch (e) {
          showErrorDialog(context, e.toString());
          debugPrint("Exception caught: ${e.toString()}");
        }
      } else {
        showErrorDialog(context, "Passwords don't match!");
        debugPrint("Passwords don't match!");
      }
  }
  
  void showErrorDialog(BuildContext context, String message) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(message),
          );
        },
      );
  }

  void logout() {
    authServ.signOut();
  }
}
