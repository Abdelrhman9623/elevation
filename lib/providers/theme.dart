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


class ThemeChanger with ChangeNotifier {
  // ThemeData _themeData;
  // ThemeChanger(this._themeData);
  // getTheme() => _themeData;
  final String key = "theme";
  SharedPreferences _prefs;
  bool _darkTheme;


  bool get darkTheme => _darkTheme;
  
  ThemeChanger() {
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



