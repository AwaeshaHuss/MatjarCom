import 'package:flutter/material.dart';
import 'package:matjarcom/general_functions.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkThemeEnabled = false;

  ThemeProvider() {
    getThemePrefrences();
  }

  set isDarkThemeOn(bool theme) {
    _isDarkThemeEnabled = theme;
    setTheme(theme);
    notifyListeners();
  }

  bool get isDarkThemeOn => _isDarkThemeEnabled;

  getThemePrefrences() async {
    _isDarkThemeEnabled = await getTheme();
    notifyListeners();
  }
}
