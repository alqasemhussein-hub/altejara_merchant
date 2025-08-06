import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier {
  Brightness brightness = Brightness.light;

  void toggleTheme() {
    brightness = (brightness == Brightness.light)
        ? Brightness.dark
        : Brightness.light;
    notifyListeners();
  }
}
