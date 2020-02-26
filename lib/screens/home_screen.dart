import 'package:elevation/constants/constants.dart';
import 'package:elevation/locale/locales.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_setting.dart';
import '../widgets/post_Card.dart';
import '../widgets/units/softFlatButton.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final deviceSize = mediaQuery.size;
    return Column(
        children: <Widget>[
          MainPostCard(deviceSize: deviceSize),
          
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
        ],
    );
  }
}


