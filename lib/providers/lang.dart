import 'dart:ui';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Lang with ChangeNotifier {
  Locale _appLocale = Locale('en');
  Locale get appLocal => _appLocale ?? Locale("en");
  // void changeLanguage(Locale type) async {
  //   var prefs = await SharedPreferences.getInstance();
  //   if (_appLocale == type) {
  //     return;
  //   }
  //   if (type == Locale("ar")) {
  //     _appLocale = Locale("ar");
  //     await prefs.setString('language_code', 'ar');
  //     await prefs.setString('countryCode', '');
  //   } else {
  //     _appLocale = Locale("en");
  //     await prefs.setString('language_code', 'en');
  //     await prefs.setString('countryCode', 'US');
  //   }
  //   notifyListeners();
  // }
  Future<void> changeDirection() async {
    if (_appLocale == Locale("ar")) {
      _appLocale = Locale("en");
    } else {
      _appLocale = Locale("ar");
    }
    final prefs = await SharedPreferences.getInstance();
    final userDate = json.encode({
      'language': _appLocale.toLanguageTag()
    });
    prefs.setString('userData', userDate);
    // print(userDate);
    notifyListeners();
  }
  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('userData') == null) {
      _appLocale = Locale('en');
      return Null;
    }
    _appLocale = Locale(prefs.getString('userData'));
    return Null;
  }
}