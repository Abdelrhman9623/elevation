import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import './providers/app_setting.dart';
import './locale/locales.dart';
import './screens/taps_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppSetteing appLanguage = AppSetteing();
  await appLanguage.fetchLocale();
  runApp(MyApp(
    appLanguage: appLanguage,
  ));
}          

class MyApp extends StatelessWidget {
    final AppSetteing appLanguage;
    final AppSetteing appThem;
  MyApp({this.appLanguage,this.appThem});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppSetteing>(
          create: (_) => appLanguage,
        ),
      ],
        child: NewMaterialAppWithTheme(),
    );
  }
}

class NewMaterialAppWithTheme extends StatelessWidget {
  final lang;
  final theme;
  NewMaterialAppWithTheme({this.lang, this.theme});
  @override
  Widget build(BuildContext context) {
    final setteing = Provider.of<AppSetteing>(context);
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
          locale: setteing.appLocal,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: setteing.darkTheme ? dark : light,
          home: TapsScreen(),
          // routes: {
          //   ProfileScreen.routeName: (ctx) => ProfileScreen(),
          // },
        ); 
  }
}
