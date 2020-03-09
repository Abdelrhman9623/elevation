import 'package:elevation/constants/constants.dart';
import 'package:elevation/locale/locales.dart';
import '../widgets/mainAppBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_setting.dart';
import '../widgets/post_Card.dart';
import '../widgets/units/softButton.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  
  void _selectLang() {
    Provider.of<AppSetteing>(context, listen: false).changeDirection();
  }
    final mediaQuery = MediaQuery.of(context);
    final deviceSize = mediaQuery.size;
    final isLandScape = mediaQuery.orientation == Orientation.landscape;
    return SafeArea(
      child: Column(
        children: <Widget>[
          PostCard(),
          Container(
            // height: 900,
            width: isLandScape ? deviceSize.width / 2 : deviceSize.width,
            child: Card(
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
          ),
        ]
      ),
    );
  }
}


