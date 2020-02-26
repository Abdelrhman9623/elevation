import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/constants.dart';

ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: appbglight,
    accentColor: postCard,
    scaffoldBackgroundColor: appbglight,
    iconTheme: IconThemeData(
      color: iconColor,
    ),
    textTheme: TextTheme(
      title: GoogleFonts.montserrat(
        color: titleColor,
        wordSpacing: 3,
        letterSpacing: 3,
        fontSize: 25,
        fontWeight: FontWeight.w400,
      ),
      subtitle: GoogleFonts.roboto(
        fontSize: 23,
        color: Colors.white
      ),
      button: GoogleFonts.robotoMono(
        color: Color(0XFF88C94E),
        wordSpacing: 1,
        fontSize: 23,
        fontWeight: FontWeight.bold,
      ),
      caption: GoogleFonts.roboto(
        color: titleColor,
        fontSize: 18,
      ),
    ),
  );

ThemeData dark = ThemeData(
    brightness: Brightness.light,
    primaryColor: appbgDark,
    // accentColor: titleCOlor,
    scaffoldBackgroundColor: appbgDark,
    iconTheme: IconThemeData(
      color: iconColor,
    ),
    textTheme: TextTheme(
      title: GoogleFonts.montserrat(
        color: Color(0XFF3B3E48),
        wordSpacing: 1,
        letterSpacing: 3,
        fontSize: 25,
        fontWeight: FontWeight.w400,
      ),
      subtitle: GoogleFonts.roboto(
        fontSize: 23,
        color: Color(0XFF2B2D35)
      ),
      button: GoogleFonts.robotoMono(
        color: Color(0XFF88C94E),
        wordSpacing: 1,
        fontSize: 23,
        fontWeight: FontWeight.bold,
      ),
      caption: GoogleFonts.roboto(
        color: Color(0XFF2B2D35),
        fontSize: 18,
      ),
    ),
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
    return Null;
  }
  
//  CONTROLLING OF LANGUAGE OF APP
  Future<void> changeDirection() async {
    var prefs = await SharedPreferences.getInstance();
    if (_appLocale == Locale("ar")) {
      _appLocale = Locale("en");
      await prefs.setString('userData', 'en');
      await prefs.setString('countryCode', 'US');
    } else {
      _appLocale = Locale("ar");
      await prefs.setString('userData', 'ar');
      await prefs.setString('countryCode', '');
    }
    notifyListeners();
  }

  // void changeLanguage(Locale type) async {
  //   var prefs = await SharedPreferences.getInstance();
  //   if (_appLocale == type) {
  //     return;
  //   }
  //   if (type == Locale("ar")) {
  //     _appLocale = Locale("ar");
  //     await prefs.setString('userData', 'ar');
  //     await prefs.setString('countryCode', '');
  //   } else {
  //     _appLocale = Locale("en");
  //     await prefs.setString('userData', 'en');
  //     await prefs.setString('countryCode', 'US');
  //   }
  //   notifyListeners();
  // }


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