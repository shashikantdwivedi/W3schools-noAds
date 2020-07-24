import 'package:flutter/material.dart';

class Bookmarks extends StatefulWidget {
  Bookmarks({Key key}) : super(key: key);

  @override
  _BookmarksState createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {
  double getHeightByPercent(int per) {
    double height = MediaQuery.of(context).size.height;
    return (per / 100) * height;
  }

  double getWidthByPercent(int per) {
    double height = MediaQuery.of(context).size.width;
    return (per / 100) * height;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: getHeightByPercent(5)),
            padding: EdgeInsets.all(20),
            child: Image.asset('assets/images/onboarding-bookmakrs.png')),
        Container(
          width: MediaQuery.of(context).size.width,
          height: getHeightByPercent(15),
          child: Center(
            child: Text(
              'Bookmark Pages',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Gilroy Light',
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
        ),
        Container(
            height: getHeightByPercent(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 10,
                    width: 10,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.grey[300], shape: BoxShape.circle)),
                Container(
                    height: 10,
                    width: 10,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor, shape: BoxShape.circle)),
                Container(
                    height: 10,
                    width: 10,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.grey[300], shape: BoxShape.circle))
              ],
            ))
      ],
    ));
  }
}
