import 'package:flutter/material.dart';
import '../locale/locales.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(AppLocalizations.of(context).title),
        ),
      ),
    );
  }
}