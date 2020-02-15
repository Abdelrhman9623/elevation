import 'package:flutter/material.dart';
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
      { 'pages': AboutScreen() },
      { 'pages': PostScreen() },
      { 'pages': ProfileScreen() },
    ];
    super.initState();
  }

  void _selctPage(int i) {
    setState(() {
      _selectPageIndex = i;
    });
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
          PopupMenuButton(
            icon: Icon(Icons.language),
            padding: const EdgeInsets.all(0),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: FlatButton(
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 25,
                        width: 25,
                        child: Image.asset(
                          'assets/images/lang_icon/ar.png', 
                          fit: BoxFit.cover, 
                          // height: 20, 
                          // width: 20,
                        ),
                      ),
                      Text('Arabic')
                    ],
                  ),
                  onPressed: () {},
                ),
                // value: ,
              ),
              PopupMenuItem(
                // enabled: false,
                child: FlatButton(
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 25,
                        width: 25,
                        child: Image.asset(
                          'assets/images/lang_icon/en.png', 
                          fit: BoxFit.cover, 
                          // height: 20, 
                          // width: 20,
                        ),
                      ),
                      Text('English')
                    ],
                  ),
                  onPressed: () {},
                ),
                // value: ,
              ),
            ],
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