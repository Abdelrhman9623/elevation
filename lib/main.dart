import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
// import 'package:flutter/services.dart';
import './providers/lang.dart';
import './locale/locales.dart';
import './screens/taps_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Lang(),
        )
      ],
      child: Consumer<Lang>(
        builder: (ctx, lang, _) => MaterialApp(
          localizationsDelegates: [
            // AppLocalizationsDelegate(),
            const TranslationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
           const Locale('ar', ""),
           const Locale('en', ""),
          ],
          locale: lang.appLocal,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: TapsScreen(),
          // routes: {
          //   ProfileScreen.routeName: (ctx) => ProfileScreen(),
          // },
        ),
      ),
    );
  }
}

