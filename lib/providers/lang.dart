import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Lang with ChangeNotifier {
  Locale _appLocale = Locale('ar');
  Locale get appLocal => _appLocale ?? Locale("ar");

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
    print(userDate);
    notifyListeners();
  }
}