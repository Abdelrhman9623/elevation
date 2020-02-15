import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  int correntInex;

  BottomNavBar(this.correntInex);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
   @override
  void setState(fn) {
    widget.correntInex = 0;
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.correntInex,
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
      onTap: (i) {
        setState(() {
          widget.correntInex = i;
        });
      },
    );
  }
}
