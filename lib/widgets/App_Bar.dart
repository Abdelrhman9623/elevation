import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class MainAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Center(
          child: Text(
            'التعاون هو الأساس', 
            style: Theme.of(context).textTheme.title,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: FaIcon(FontAwesomeIcons.language),
            onPressed: () {},
          ),
        ],
      );
  }
}