import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/services.dart';
import './locale/locales.dart';
import './screens/taps_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

   SpecificLocalizationDelegate  specificLocaliztionDelegate;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    specificLocaliztionDelegate = SpecificLocalizationDelegate(new Locale("en"));
  }

  onLocaleChange(Locale local) {
    setState(() {
      specificLocaliztionDelegate = SpecificLocalizationDelegate(local);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        // AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        specificLocaliztionDelegate
      ],
      supportedLocales: [
        Locale('ar', ""),
        Locale('en', ""),
      ],
      locale: specificLocaliztionDelegate.overriddenLocale,
      title: 'Flutter Demo',
      theme: ThemeData(
         primarySwatch: Colors.green,
      ),
      home: TapsScreen(specificLocaliztionDelegate),
      // routes: {
      //   ProfileScreen.routeName: (ctx) => ProfileScreen(),
      // },
    );
  }
}

