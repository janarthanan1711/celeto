import 'package:celeto/Resources/config.dart';
import 'package:flutter/material.dart';

class Mytheme extends ChangeNotifier{
  static bool isDark = true;

 Mytheme(){
  if(box.containsKey('currentTheme')){
   isDark =  box.get('currentTheme');
  }else{
    box.put('currentTheme',isDark);
  }
}
  ThemeMode currentTheme() {
     return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void switchTheme(){
    isDark = !isDark;
    box.put('currentTheme',isDark);
    notifyListeners();
  }


}