import 'dart:ui';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/constants.dart';

ThemeData light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.grey,
    accentColor: titleCOlor,
    scaffoldBackgroundColor: Color(0xfff1f1f1)
  );

  ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.grey,
    accentColor: titleCOlor,
  );

class AppSetteing with ChangeNotifier {
  final String key = "theme";
  SharedPreferences _prefs;
  bool _darkTheme;
  Locale _appLocale;
  Locale get appLocal => _appLocale;
  bool get darkTheme => _darkTheme;
  
// FETCH MY CHOOSEN LANG AND SAVE IT 
  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('userData') == null) {
      _appLocale = Locale('ar');
      return Null;
    }
    _appLocale = Locale(prefs.getString('userData'));
    // // _appLocale = Locale('ar');
    // print(_appLocale);
    return Null;

  }
  
//  CONTROLLING OF LANGUAGE OF APP
  // Future<void> changeDirection() async {
  //   var prefs = await SharedPreferences.getInstance();
  //   if (_appLocale == Locale("ar")) {
  //     _appLocale = Locale("en");
  //     final userDate = json.encode({
  //       'language': _appLocale.toLanguageTag()
  //      });
  //      prefs.setString('userData', userDate);
  //       print(userDate);
  //   } else {
  //     _appLocale = Locale("ar");
  //     final userDate = json.encode({
  //       'language': _appLocale.toLanguageTag()
  //      });
  //      prefs.setString('userData', userDate);
  //      print(userDate);
  //   }
  //   // final userDate = json.encode({
  //   //   'language': _appLocale.toLanguageTag()
  //   // });
  //   notifyListeners();
  // }

  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    if (_appLocale == type) {
      return;
    }
    if (type == Locale("ar")) {
      _appLocale = Locale("ar");
      await prefs.setString('userData', 'ar');
      await prefs.setString('countryCode', '');
    } else {
      _appLocale = Locale("en");
      await prefs.setString('userData', 'en');
      await prefs.setString('countryCode', 'US');
    }
    notifyListeners();
  }


  // SET OUR THEME
  AppSetteing() {
    _darkTheme = true;
    _loadFromPrefs();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if(_prefs == null)
      _prefs = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = _prefs.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs()async {
    await _initPrefs();
    _prefs.setBool(key, _darkTheme);
  }

}



  