import 'package:elevation/constants/constants.dart';
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
import '../widgets/bottom_bar_item.dart';

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
      { 'pages': HomeScreen(),},
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
      appBar: AppBar(
        elevation: 6,
        backgroundColor: Theme.of(context).primaryColor,
        title: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: Container(
            margin: const EdgeInsets.only(top: 5),
            child: MainAppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    Translations.of(context).title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  IconButtonBase(
                    button: IconButton(
                      icon: Icon(
                        Icons.account_circle, 
                        color: Theme.of(context).iconTheme.color,
                        size: Theme.of(context).iconTheme.size,
                      ),
                      onPressed: _selectLang,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: page[selectPageIndex]['pages'],
        ), 
        bottomNavigationBar: MainBottomNavBar(
          selectPageIndex: selectPageIndex,
          selctPage: selctPage,
        ),
    );
  }
}