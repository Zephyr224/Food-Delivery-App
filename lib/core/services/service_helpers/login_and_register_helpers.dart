import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/services/auth/auth_service.dart';

class LoginAndRegisterHelper extends ChangeNotifier {
  final authServ = AuthService();

  void login(String email, String password, BuildContext context) async {
    try {
      await authServ.signInWithEmailAndPassword(email, password);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(e.toString()),
          );
        },
      );
    }
  }
}
