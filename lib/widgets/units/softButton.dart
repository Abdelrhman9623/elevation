import 'package:flutter/material.dart';
import '../../constants/constants.dart';

class IconButtonBase extends StatelessWidget {
  double radius;
  final Widget button;
  IconButtonBase({key, this.radius, @required this.button}) 
  : super(key: key) {
    if (radius == null || radius <= 0) 
      radius = 32;
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: radius * 2,
          height: radius * 2,
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(radius),
            boxShadow: [
              BoxShadow( color: Theme.of(context).primaryColor, offset: Offset(8,6), blurRadius: 12 ),
              BoxShadow( color: Colors.white, offset: Offset(-4,-4), blurRadius: 12 ),
            ]
          ),
        ),
        Positioned.fill(child: button,)
      ], 
    );
  }
}