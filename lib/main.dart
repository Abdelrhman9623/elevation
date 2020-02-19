import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/services.dart';
import './providers/lang.dart';
import './locale/locales.dart';
import './screens/taps_screen.dart';

void main() async {
  Lang appLanguage = Lang();
  WidgetsFlutterBinding.ensureInitialized();
  await appLanguage.fetchLocale();
  runApp(MyApp(
    appLanguage: appLanguage,
  ));
}

// void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    final Lang appLanguage;
  MyApp({this.appLanguage});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Lang>(
          create: (_) => appLanguage,
          child: Consumer<Lang>(
            builder: (ctx, lang, child) {
              return MaterialApp(
                localizationsDelegates: [
                  // AppLocalizationsDelegate(),
                  TranslationsDelegate(),
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
              );
            } 
          ),
          // value: Lang(),
    );
  }
}

