import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme.dart';
import '../locale/locales.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context, listen: false);
    return Card(
      // color: Colors.amber,
      child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Consumer<ThemeChanger>(
          builder: (context,notifier,child) => SwitchListTile(
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