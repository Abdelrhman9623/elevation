import './../locale/locales.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './../widgets/bottom_bar_item.dart';
class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile-page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Center(
          child: Text(
            Translations.of(context).title, 
            style: Theme.of(context).textTheme.title,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.solidUserCircle,
              color: Theme.of(context).iconTheme.color,
              size: Theme.of(context).iconTheme.size,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Text('profile'),
      ),
      bottomNavigationBar: MainBottomNavBar(),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        // elevation: 10.0,
        child: Icon(
          Icons.add,
        ),
        onPressed: () {},
      ),
    );
  }
}