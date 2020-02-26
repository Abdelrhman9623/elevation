import 'package:elevation/constants/constants.dart';
import 'package:elevation/widgets/bottom_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../locale/locales.dart';
import '../providers/app_setting.dart';
import '../screens/home_screen.dart';
import '../screens/about_screen.dart';
import '../screens/posts_screen.dart';
import '../screens/profile_screen.dart';
import '../widgets/units/softButton.dart';
import '../widgets/mainAppBar.dart';

class TapsScreen extends StatefulWidget {
  @override
  _TapsScreenState createState() => _TapsScreenState();
}


class _TapsScreenState extends State<TapsScreen> {
    List<Map<String, Object>> page;
    int selectPageIndex = 0;

  @override
  void initState() {
    page = [
      { 'pages': HomeScreen(), },
      { 'pages': AboutScreen(), },
      { 'pages': PostScreen(), },
      { 'pages': ProfileScreen(), },
    ];
    super.initState();
  }

  void selctPage(int i) {
    setState(() {
      selectPageIndex = i;
    });
  }

  void _selectLang() {
    Provider.of<AppSetteing>(context, listen: false).changeDirection();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _copyRight() async {
      return showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          // backgroundColor: Colors.green[50].withOpacity(0.4),
          title: Center(
            child: Text(
              'Copyright', 
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
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
      body: ListView(
        children: <Widget>[
          MainAppBar(
            title: Container(
              padding: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    Translations.of(context).title,
                    style: Theme.of(context).textTheme.title, 
                  ),
                  IconButtonBase(
                    button: IconButton(
                      color: Theme.of(context).iconTheme.color,
                      icon: Icon(Icons.copyright),
                      iconSize: 32,
                      onPressed: _copyRight,
                    ),
                  ),
                ],
              ),
            ),
          ),
          page[selectPageIndex]['pages']
        ],
      ),
      bottomNavigationBar: MainBottomNavBar(
        selectPageIndex: selectPageIndex,
        selctPage: selctPage,
      ),
    );
  }
}