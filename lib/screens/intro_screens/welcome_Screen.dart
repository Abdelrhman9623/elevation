import 'package:elevation/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:google_fonts/google_fonts.dart';
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[600],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Card(
                  elevation: 0,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(0.6),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    width: double.infinity,
                    child: Text(
                      'HEY WHATS UP ?', 
                      textAlign: TextAlign.center,
                      style: GoogleFonts.cairo(
                        color: Colors.lime,
                        fontSize: 20,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: EmptyListWidget(
                      title: 'Welcome',
                      subTitle: 'I hope to find What do you need here ?',
                      // image: 'assets/images/userIcon.png',
                      titleTextStyle: Theme.of(context).typography.dense.display1.copyWith(color: Colors.deepOrangeAccent),
                      subtitleTextStyle: Theme.of(context).typography.dense.body2.copyWith(color: Colors.deepOrange)
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // ProgressIndicator(
                      //   backgroundColor: Colors.amber,
                      //   semanticsLabel: 'Loadding...',
                      //   semanticsValue: 'Welcome',
                      //   value: 200,
                      //   valueColor: ,
                      // ),
                      CircularProgressIndicator(
                        // value: 0.5,
                        backgroundColor: Colors.amber,
                        semanticsLabel: 'Loadding...',
                        semanticsValue: 'Welcome',
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrangeAccent),
                      ),
                      SizedBox(height: 10,),
                      Text('LOADING...')
                    ],
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}