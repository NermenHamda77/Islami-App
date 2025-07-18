import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier{
  String appLanguage = "en";
  ThemeMode appMode = ThemeMode.light;

  void changeAppLanguage(String newLanguage) async{
    if(appLanguage == newLanguage){
      return;
    }
    appLanguage = newLanguage;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("language", appLanguage);
  }

  void changeAppMode(ThemeMode newMode)async{
    if(appMode == newMode){
      return;
    }
    appMode = newMode;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isDark", isDarkMode());
  }

  bool isDarkMode(){
    return appMode == ThemeMode.dark;
  }

}