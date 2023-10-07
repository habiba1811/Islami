import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String local = 'en';
  ThemeMode theme = ThemeMode.light;

  changeMode(ThemeMode mode) {
    theme = mode;
    notifyListeners();
  }

  changeLanguage(String langCode) {
    local = langCode;
    notifyListeners();
  }
}
