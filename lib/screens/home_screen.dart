import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_setting.dart';
// import '../providers/theme.dart';
// import '../locale/locales.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final theme = Provider.of<AppSetteing>(context, listen: false);
    return Card(
      // color: Colors.amber,
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
    );
  }
}