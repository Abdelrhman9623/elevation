import 'package:flutter/foundation.dart';

class Posts with ChangeNotifier {
  final String id;
  final List<String> postCategories; 
  final String title;
  final String des;
  final String imageUrl;
  final String replay;
  bool visibil;

  Posts({
    this.id,
    this.postCategories,
    this.title,
    this.des,
    this.imageUrl,
    this.replay,
    this.visibil = true,
  });

}