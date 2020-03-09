import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' as intl;
// import 'customIcons.dart';
import '../mocks/dummy_data.dart';
import 'dart:math';

class PostCard extends StatefulWidget {
  @override
  _PostCardState createState() => new _PostCardState();
}

var cardAspectRatio = 14.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _PostCardState extends State<PostCard> {
  var currentPage = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("إنجازات",
                  style: Theme.of(context).textTheme.title,
                ),
                IconButton(
                  icon: Icon(
                    Icons.info,
                    size: 18.0,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          Stack(
            children: <Widget>[
              CardScrollWidget(currentPage),
              Positioned.fill(
                child: PageView.builder(
                  itemCount: images.length,
                  controller: controller,
                  reverse: true,
                  itemBuilder: (context, index) {
                    return Container();
                  },
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("مفقودين",
                    style: GoogleFonts.cairo(
                      color: Colors.white,
                      fontSize: 46.0,
                      letterSpacing: 1.0,
                    )),
                    
                IconButton(
                  icon: Icon(
                    Icons.info,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 22.0, vertical: 6.0),
                      child: Text("الاخير",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Text("9+ مواضيع",
                    style: TextStyle(color: Colors.blueAccent))
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 15.0;
  var verticalInset = 10.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 3;


        List<Widget> cardList = new List();

        for (var i = 0; i < images.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;
          var start = intl.Bidi.isRtlLanguage( Localizations.localeOf(context).languageCode) 
            != true ? padding + max(
              primaryCardLeft -
                  horizontalInset * -delta * (isOnRight ? 15 : 1),
              0.0) : null;
          var end = intl.Bidi.isRtlLanguage( Localizations.localeOf(context).languageCode) 
            == true ? padding + max(
            primaryCardLeft -
                horizontalInset * -delta * (isOnRight ? 15 : 1),
            0.0) : null;

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            end: end,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(3.0, 6.0),
                      blurRadius: 10.0)
                ]),
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.network(images[i], fit: BoxFit.cover),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Text(title[i],
                                  style: GoogleFonts.cairo(
                                    color: Colors.white, fontSize: 25.0),
                                    textAlign: TextAlign.center,
                                  ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: TextDirection.rtl != null ? 12.0 : 0.0,
                                  left: TextDirection.rtl != null ? 12.0 : 0.0,
                                  bottom: 12.0),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 22.0, vertical: 6.0),
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Text("إقرأ المزيد ",
                                    style: TextStyle(color: Colors.white, ), textAlign: TextAlign.center,),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}