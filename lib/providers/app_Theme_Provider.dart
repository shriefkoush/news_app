import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier {
  //data
  ThemeMode appTheme = ThemeMode.dark;
  // ال fuction اللي هتغير الداتا

  void changeTheme(ThemeMode newTheme) {
    if (appTheme == newTheme) {
      return;
    }
    appTheme = newTheme;
    notifyListeners();
  }

  bool isDarkMode(){
    return appTheme == ThemeMode.dark;
  }
}
