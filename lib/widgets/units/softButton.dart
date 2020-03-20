import 'package:flutter/material.dart';
import '../../constants/constants.dart';

class IconButtonBase extends StatelessWidget {
  double radius;
  final Widget button;
  IconButtonBase({key, this.radius, @required this.button}) 
  : super(key: key) {
    if (radius == null || radius <= 0) 
      radius = 25;
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: radius * 2.5,
          height: radius * 2.5,
          // decoration: BoxDecoration(
          //   color: Theme.of(context).primaryColor.withOpacity(0.8),
          //   border: Border.all(
          //     color: Color(0XFF59bee1), 
          //     width: 3,
          //     style: BorderStyle.solid
          //   ),
          //   borderRadius: BorderRadius.only(
          //     bottomLeft: Radius.circular(radius),
          //     topRight: Radius.circular(radius)
          //   ),
          //   boxShadow: [
          //     BoxShadow( 
          //       color: Theme.of(context).accentColor, 
          //       offset: Offset(8,6), 
          //       blurRadius: 12 
          //     ),
          //     BoxShadow( 
          //       color: appbgDark, 
          //       offset: Offset(-4,-6), 
          //       blurRadius: 12, 
          //     ),
          //   ]
          // ),
        ),
        Positioned.fill(child: button,)
      ], 
    );
  }
}