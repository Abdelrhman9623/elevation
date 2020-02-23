import 'package:elevation/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:empty_widget/empty_widget.dart';
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroudColorDark,
      body: Center(
        child: EmptyListWidget(
          title: 'Welcome',
          subTitle: 'I hope to find What do you need here ?',
          image: 'assets/images/userIcon.png',
          titleTextStyle: Theme.of(context).typography.dense.display1.copyWith(color: Color(0xff9da9c7)),
          subtitleTextStyle: Theme.of(context).typography.dense.body2.copyWith(color: Color(0xffabb8d6))
        ),
      ),
    );
  }
}