import 'package:flutter/foundation.dart';

class Posts with ChangeNotifier {
  final String id;
  final String title;
  final String des;
  final String imageUrl;
  final String replay;
  bool visibil;

  Posts({
    @required this.id,
    @required this.title,
    @required this.des,
    @required this.imageUrl,
    @required this.replay,
    this.visibil = false,
  });

}