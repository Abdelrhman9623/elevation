import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/constants.dart';

class MainAppBar extends StatelessWidget {
  final Widget title;
  MainAppBar({key, @required this.title})
  : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final deviceSize = mediaQuery.size;
    final isLandScape = mediaQuery.orientation == Orientation.landscape;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;
    return Center(
      child: Container(
        height: isLandScape ? deviceSize.height / 1 * 0.3 : deviceSize.height / 2 * 0.3,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: title,
      ),
    );
  }
}