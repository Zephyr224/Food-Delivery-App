import 'package:flutter/material.dart';

import '../../src/example_feature/views/auth/login_page.dart';

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