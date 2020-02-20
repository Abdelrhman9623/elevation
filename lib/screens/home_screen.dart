import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_setting.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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