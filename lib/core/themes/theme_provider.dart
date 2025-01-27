import 'package:flutter/material.dart';

import 'dark_mode.dart';
import 'light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDark => _themeData == darkMode;

  // void setToDarkMode(ThemeData themeData) {
  //   _themeData = themeData;
  //   notifyListeners();
  // }

  void toggleTheme() {
    // if 
    _themeData = isDark ? darkMode : lightMode;
    notifyListeners();
  }
}
