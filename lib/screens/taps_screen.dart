import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import '../locale/locales.dart';
import '../locale/helperLocale.dart';
import '../providers/lang.dart';
import '../screens/home_screen.dart';
import '../screens/about_screen.dart';
import '../screens/posts_screen.dart';
import '../screens/profile_screen.dart';
class TapsScreen extends StatefulWidget {
  @override
  _TapsScreenState createState() => _TapsScreenState();
}

class _TapsScreenState extends State<TapsScreen> {
    List<Map<String, Object>> _page;
    int _selectPageIndex = 0;
    

  @override
  void initState() {
    _page = [
      { 'pages': HomeScreen(), },
      { 'pages': AboutScreen(), },
      { 'pages': PostScreen(), },
      { 'pages': ProfileScreen(), },
    ];
    super.initState();
  }

  void _selctPage(int i) {
    setState(() {
      _selectPageIndex = i;
    });
  }
  // onLocaleChange(Locale local) {
  //   setState(() {
  //     // widget.specificLocaliztionDelegate = SpecificLocalizationDelegate(local);
  //   });
  // }

  void _selectLang() {
    Provider.of<Lang>(context, listen: false).changeDirection();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _copyRight() async {
      return showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          // backgroundColor: Colors.green[50].withOpacity(0.4),
          title: Center(child: Text('Copyright')),
          content: Container(
            // padding: const EdgeInsets.all(8),
            child: Text(
              'Hey Whats up ! My Name is Abdelrhman Mohammed E-mail abdelrhman4mohammed@gmail.com, Number: +201012982096',
              style: TextStyle( fontWeight: FontWeight.bold, color: Colors.brown),
              textAlign: TextAlign.center,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Close', 
                style: TextStyle(
                  color: Theme.of(context).errorColor ), 
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            ),
          ],
        )
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('ELEVATION OF US'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.copyright),
            onPressed: _copyRight,
          ),
          MaterialButton(
            onPressed: _selectLang,
            child: Icon(Icons.language, color: Colors.white,) //Text(Translations.of(context).language),
          ),
        ],
      ),
      body: _page[_selectPageIndex]['pages'],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectPageIndex,
          // type: BottomNavigationBarType.fixed,
          // backgroundColor: Colors.green[900],
          selectedItemColor: Colors.white,
          iconSize: 30,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              // activeIcon: Icon(Icons.person_add),
              title: Text('Home'),
              backgroundColor: Colors.green[300]
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              title: Text('About'),
              backgroundColor: Colors.green[400]
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.send),
              title: Text('Post'),
              backgroundColor: Colors.green[600]
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              activeIcon: Icon(Icons.account_circle),
              title: Text('Profile'),
              backgroundColor: Colors.green[900]
            ),
          ],
          onTap: _selctPage,
        ),
    );
  }
}