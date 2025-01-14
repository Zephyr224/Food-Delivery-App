import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/navigation/bottom_nav_bar.dart';

import '../../../src/example_feature/views/home_page.dart';
import '../../../src/example_feature/views/auth/login_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  // class cheecks if we are logged in or not
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const BottomNavBar();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
