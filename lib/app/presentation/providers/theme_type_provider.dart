
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;

  ThemeMode get themeMode => _themeMode;

  void setThemeMode(bool isDark) {
    if(isDark){
      _themeMode = ThemeMode.dark;
    }else{
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}