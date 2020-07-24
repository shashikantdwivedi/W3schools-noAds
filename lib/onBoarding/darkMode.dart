import 'package:flutter/material.dart';

class DarkMode extends StatelessWidget {
  const DarkMode({Key key}) : super(key: key);

  double getHeightByPercent(int per, context) {
    double height = MediaQuery.of(context).size.height;
    return (per / 100) * height;
  }

  double getWidthByPercent(int per, context) {
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
            height: getHeightByPercent(50, context),
            margin: EdgeInsets.only(bottom: getHeightByPercent(5, context)),
            padding: EdgeInsets.all(20),
            child: Image.asset(
              'assets/images/onboarding-darkmode.png',
            )),
        Container(
          width: MediaQuery.of(context).size.width,
          height: getHeightByPercent(15, context),
          child: Center(
            child: Text(
              'Dark Mode',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Gilroy Light',
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
        ),
        Container(
            height: getHeightByPercent(15, context),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/startScreen');
                    },
                    child: Text('Finish', style: TextStyle(
                      fontFamily: 'Gilroy Bold',
                      color: Colors.white,
                      fontSize: 25
                    ),),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                    color: Theme.of(context).primaryColor,
                  ))
            ]))
      ],
    ));
  }
}
