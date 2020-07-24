import 'package:flutter/material.dart';

class NoAds extends StatefulWidget {
  NoAds({Key key}) : super(key: key);

  @override
  _NoAdsState createState() => _NoAdsState();
}

class _NoAdsState extends State<NoAds> {
  
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
          // decoration: BoxDecoration(border: Border.all()),
            margin: EdgeInsets.only(bottom: getHeightByPercent(10)),
            padding: EdgeInsets.all(20),
            child: Image.asset('assets/images/onboarding-no-ads.png')),
        Container(
          width: MediaQuery.of(context).size.width,
          height: getHeightByPercent(15),
          child: Center(
            child: Text(
              'Ad Free Surfing',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Gilroy Light', fontSize: 30, color: Theme.of(context).primaryColor),
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
                        color: Theme.of(context).primaryColor, shape: BoxShape.circle)),
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
                        color: Colors.grey[300], shape: BoxShape.circle))
              ],
            ))
      ],
    ));
  }
}
