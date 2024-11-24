import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_delivery_app/core/services/auth/auth_gate.dart';
import 'package:provider/provider.dart';

import 'core/services/service_helpers/login_and_register_helpers.dart';
import 'core/themes/theme_provider.dart';
import 'src/example_feature/views/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: context.read<ThemeProvider>().themeData,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => LoginAndRegisterHelper()),
        ],
        child: const AuthGate(),
      ),
    );
  }
}
