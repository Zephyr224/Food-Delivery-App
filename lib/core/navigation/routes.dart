import 'package:flutter/material.dart';
import 'package:food_delivery_app/src/example_feature/views/login_page.dart';
import 'package:food_delivery_app/src/example_feature/views/register_page.dart';

class Routes {
  static const String loginPage = "loginPage";
  static const String registerPage = "registerPage";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      default:
      throw const FormatException("Route not found! Check routes again");
    }
  }
}