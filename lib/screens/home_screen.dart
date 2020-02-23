import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/app_setting.dart';
import '../widgets/units/softFlatButton.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          elevation: 0,
          color: Colors.transparent,
          child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Consumer<AppSetteing>(
              builder: (context,notifier,child) => SwitchListTile.adaptive(
                  title: Text("Dark Mode"),
                  onChanged: (val){
                    notifier.toggleTheme();
                  },
                  value: notifier.darkTheme ,
                ),
                ),
              ),
            ),
        ),
        SoftFlatButton(
          flatBtn: FlatButton(
            clipBehavior: Clip.antiAlias,
            // color: Colors.black,
            child: Text('test', style: GoogleFonts.cairo(
              color: Colors.white,
            ),),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}