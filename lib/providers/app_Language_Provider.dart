import 'package:flutter/cupertino.dart';

class AppLanguageProvider extends ChangeNotifier{
 String appLanguage = "en";

 changeLanguage(String newLanguage){
   if (appLanguage == newLanguage){
     return;
   }else {
     appLanguage = newLanguage;
   }
   notifyListeners();
 }
}