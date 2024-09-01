import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier{

  String currentLanguage= "en";
  ThemeMode currentTheme= ThemeMode.light ;

  changeCurrentLanguage(String newLanguage){
    if(currentLanguage== newLanguage) return;
    currentLanguage= newLanguage;
    notifyListeners();
  }

  changeCurrentTheme(ThemeMode newTheme){
    if(currentTheme == newTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }

  String getSplashImage() {
    return isDark()
        ? "assets/images/dark_splash_background.png"
        : "assets/images/splash_background.png";
  }

  bool isDark(){
     return currentTheme == ThemeMode.dark;
  }

}