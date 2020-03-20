import 'dart:ui';
import './../helper/custom_routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/constants.dart';

ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: appbglight,
    accentColor: accentColor,
    scaffoldBackgroundColor: appbglight,
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CustomPageTransitionBuilder(),
        TargetPlatform.iOS: CustomPageTransitionBuilder(),
      }
    ),
    appBarTheme: AppBarTheme(
      color: Colors.transparent
    ),
    iconTheme: IconThemeData(
      color: iconColor,
      size: 30,
    ),
    textTheme: TextTheme(
      title: GoogleFonts.cairo(
        color: titleColor,
        wordSpacing: 1,
        letterSpacing: 3,
        fontSize: 25,
        fontWeight: FontWeight.w400,
      ),
      subtitle: GoogleFonts.cairo(
        fontSize: 23,
        color: Colors.white
      ),
      button: GoogleFonts.cairo(
        color: Colors.white,
        wordSpacing: 1,
        fontSize: 18,
        // fontWeight: FontWeight.bold,
      ),
      caption: GoogleFonts.cairo(
        color: titleColor,
        fontSize: 18,
      ),
    ),
  );

ThemeData dark = ThemeData(
    brightness: Brightness.light,
    primaryColor: appbgDark,
    accentColor: accentColorDark,
    scaffoldBackgroundColor: appbgDark,
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CustomPageTransitionBuilder(),
        TargetPlatform.iOS: CustomPageTransitionBuilder(),
      }
    ),
    iconTheme: IconThemeData(
      color: iconColorDark,
      size: 30,
    ),
    textTheme: TextTheme(
      title: GoogleFonts.cairo(
        color: Color(0XFFd0d3da),
        wordSpacing: 1,
        letterSpacing: 3,
        fontSize: 25,
        fontWeight: FontWeight.w400,
      ),
      subtitle: GoogleFonts.cairo(
        fontSize: 23,
        color: Color(0XFFd0d3da)
      ),
      button: GoogleFonts.cairo(
        color: Color(0XFF88C94E),
        wordSpacing: 1,
        fontSize: 18,
        // fontWeight: FontWeight.bold,
      ),
      caption: GoogleFonts.cairo(
        color: Color(0XFFd0d3da),
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

  void showIfo(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (ctx) => GestureDetector(
        child: Card(
          child: Text('hello !!'),
        ),
        onTap: () {},
        behavior: HitTestBehavior.opaque,
      )
    );
  }

}