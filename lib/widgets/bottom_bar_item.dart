import 'package:flutter/material.dart';
class MainBottomNavBar extends StatelessWidget {
  final int selectPageIndex;
  final Function selctPage;
  MainBottomNavBar({this.selectPageIndex, this.selctPage});
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
          currentIndex: selectPageIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).accentColor,
          selectedItemColor: Theme.of(context).iconTheme.color,
          showSelectedLabels: true,
          iconSize: 30,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              // activeIcon: Icon(Icons.person_add),
              title: Text('Home'),
              // backgroundColor: Colors.green[300]
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              title: Text('About'),
              // backgroundColor: Colors.green[400]
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.send),
              title: Text('Post'),
              // backgroundColor: Colors.green[600]
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              activeIcon: Icon(Icons.account_circle),
              title: Text('Profile'),
              // backgroundColor: Colors.green[900]
            ),
          ],
          onTap: selctPage,
        );
  }
}