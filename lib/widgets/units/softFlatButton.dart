import '../../constants/constants.dart';
import 'package:flutter/material.dart';
class SoftFlatButton extends StatelessWidget {
  double height;
  double width;
  final Widget flatBtn;
  SoftFlatButton({key, this.height, this.width, @required this.flatBtn})
  : super(key: key) {
    if (height == null || height <= 0 && width == null || width <= 0) {
      height = 45;
      width = 160;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: btnBgColor.withOpacity(0.9),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow( color: Theme.of(context).primaryColor, offset: Offset(8,6), blurRadius: 8 ),
          BoxShadow( color: Colors.white, offset: Offset(-4,-4), blurRadius: 8 ),
        ],
      ),
      child: flatBtn,
    );
  }
}