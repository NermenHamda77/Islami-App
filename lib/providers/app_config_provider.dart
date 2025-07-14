import 'package:flutter/cupertino.dart';

class AppConfigProvider extends ChangeNotifier{
  String appLanguage = "en";

  void changeAppLanguage(String newLanguage){
    if(appLanguage == newLanguage){
      return;
    }
    appLanguage = newLanguage;
    notifyListeners();
  }
}