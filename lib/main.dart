import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/services.dart';
import './providers/lang.dart';
import './providers/theme.dart';
import './locale/locales.dart';
import './screens/taps_screen.dart';

void main() async {
  Lang appLanguage = Lang();
  // ThemeChanger appTheme = ThemeChanger();
  WidgetsFlutterBinding.ensureInitialized();
  await appLanguage.fetchLocale();
  runApp(MyApp(
    appLanguage: appLanguage,
    // appThem: appTheme,
  ));
}

// void main() => runApp(MThemeData(
            //   primarySwatch: Colors.green,
            // )yApp());

class MyApp extends StatelessWidget {
    final Lang appLanguage;
    final ThemeChanger appThem;
  MyApp({this.appLanguage,this.appThem});
  @override
  Widget build(BuildContext context) {
    // final theme = Provider.of<ThemeChanger>(context).getTheme();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Lang>(
          create: (_) => appLanguage, 
        ),
        ChangeNotifierProvider<ThemeChanger>(
          create: (_) => ThemeChanger(),
          child: new NewMaterialAppWithTheme(), 
        ),
      ],
        child: Consumer<Lang>(
          builder: (ctx, lang, child) {
            return NewMaterialAppWithTheme(
              lang: lang,
            );
          } 
        ),
    );
  }
}

class NewMaterialAppWithTheme extends StatelessWidget {
  final lang;
  final theme;
  NewMaterialAppWithTheme({this.lang, this.theme});
  @override
  Widget build(BuildContext context) {
    // final theme = Provider.of<ThemeChanger>(context);
    return Consumer<ThemeChanger>(
      builder: (ctx, ThemeChanger theme, child) {
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
          theme: theme.darkTheme ? dark : light,
          home: TapsScreen(),
          // routes: {
          //   ProfileScreen.routeName: (ctx) => ProfileScreen(),
          // },
        ); 
      },
    );
  }
}

