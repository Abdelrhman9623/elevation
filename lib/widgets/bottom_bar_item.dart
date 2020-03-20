import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './../screens/about_screen.dart';
import './../screens/posts_screen.dart';
import './../screens/profile_screen.dart';
import './../widgets/units/softButton.dart';
class MainBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final deviceSize = mediaQuery.size;
    final isLandScap = mediaQuery.orientation == Orientation.landscape;
    return BottomAppBar(
      color: Theme.of(context).accentColor,
      child: Container(
        height: isLandScap ? deviceSize.height / 2.7 * 0.5 : deviceSize.height / 2.3 * 0.2,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButtonBase(
              button: IconButton(
                icon: FaIcon(FontAwesomeIcons.home),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/');
                },
              ),
            ),
            IconButtonBase(
              button: IconButton(
                icon: FaIcon(FontAwesomeIcons.users),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(AboutScreen.routeName);
                },
              ),
            ),
            IconButtonBase(
              button: IconButton(
                icon: FaIcon(FontAwesomeIcons.heart),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(PostScreen.routeName);
                },
              ),
            ),
            IconButtonBase(
              button: IconButton(
                icon: FaIcon(FontAwesomeIcons.userCog),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(ProfileScreen.routeName);
                },
              ),
            ),
          ],
        ),
      ),
      shape: CircularNotchedRectangle(),
    );
  }
}