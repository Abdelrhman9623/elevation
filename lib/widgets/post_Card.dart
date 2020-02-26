import 'package:flutter/material.dart';


class MainPostCard extends StatelessWidget {
  final Size deviceSize;
  const MainPostCard({
    @required this.deviceSize,
  });


  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandScape = mediaQuery.orientation == Orientation.landscape;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;
    return Container(
      height: isLandScape ? deviceSize.height * 2 - 130 : deviceSize.height / 2 * 0.5 + 285 ,
      child: Card(
        elevation: 0,
        color: Theme.of(context).accentColor.withOpacity(0.4),
        child: Column(
          // scrollDirection: Axis.vertical,
          // reverse: true,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Post Title', style: Theme.of(context).textTheme.subtitle,),
                  CircleAvatar(
                    backgroundColor: Colors.amber,
                  ),
                ],
              ),
            ),
            // Divider(),
            Container(
              margin: const EdgeInsets.only(top: 10,bottom: 10),
              // height: deviceSize.height / 4 ,
              width: double.infinity,
              child: Image.network(
                'https://2.bp.blogspot.com/-3WoUIc67aC8/XNcwBnUyqUI/AAAAAAAACCA/euuPNyukXWU8yYWvS9b045Zliouxi_krACLcBGAs/s640/55539285_3293282127363981_4873612125072785408_n.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Text(
                'It’s never been easy to break up, and it’s gotten even worse in the social media era. Everything that happens in our lives goes public, sometimes whether we like it or not. The songs tell us that breaking up is hard to do – and now you get to do it while your ex is posting their incessant status updates about new friends and new partners.', 
                style: Theme.of(context).textTheme.caption
              ),
            ),
          ],
        )
      ),
    );
  }
}