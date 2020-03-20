import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './../locale/locales.dart';
import './../providers/app_setting.dart';
import './../widgets/bottom_bar_item.dart';
import './../widgets/post_Card.dart';
class MainScreen extends StatelessWidget {
  static const routeName = '/';



  @override
  Widget build(BuildContext context) {
    void _selectLang() {
      Provider.of<AppSetteing>(context, listen: false).changeDirection();
    }
    void _showProf() {
      Provider.of<AppSetteing>(context, listen: false).showIfo(context);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Center(
          child: Text(
            Translations.of(context).title, 
            style: Theme.of(context).textTheme.title,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.solidUserCircle,
              color: Theme.of(context).iconTheme.color,
              size: Theme.of(context).iconTheme.size,
            ),
            onPressed: () => _showProf(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            PostCard(),
            Container(
                  // height: 900,
                  width: double.infinity,
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
          ],
        ),
      ),
      bottomNavigationBar: MainBottomNavBar(),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        // elevation: 10.0,
        child: FaIcon(
          FontAwesomeIcons.plus,
          size: 23,
        ),
        onPressed: () {},
      ),
    );
  }
}