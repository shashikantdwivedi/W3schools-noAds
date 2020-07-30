import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w3school/components/bottomBar.dart';
import 'blackBox.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

import 'home.dart';

class NoInternet extends StatefulWidget {
  _NoInternet createState() => _NoInternet();
}

class _NoInternet extends State<NoInternet> {
  @override
  Widget build(BuildContext context) {
    var blackBoxProvider = Provider.of<BlackBox>(context);
    return SafeArea(
        child: Scaffold(
          bottomNavigationBar: bottomBar(blackBoxProvider, context),
      backgroundColor:
          blackBoxProvider.getDarkMode ? Colors.black : Colors.white,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Network Error',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Gilroy Bold',
                    fontSize: 35,
                    color: blackBoxProvider.getDarkMode
                        ? Colors.white
                        : Colors.black),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                'Connect to internet and try again',
                style: TextStyle(
                    fontFamily: 'Gilroy SemiBold',
                    fontSize: 17,
                    color: blackBoxProvider.getDarkMode
                        ? Colors.white60
                        : Colors.black54),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 50,
              width: 180,
              child: FlatButton(
                  color: Color(0xFF4CAF50),
                  onPressed: () async {
                    bool result = await DataConnectionChecker().hasConnection;
                    if (result == true) {
                      Navigator.of(context).pushReplacement(new MaterialPageRoute(
                          builder: (BuildContext context) => Home()));
                    }
                  },
                  child: Text(
                    'Check Again',
                    style: TextStyle(
                      fontFamily: 'Gilroy SemiBold',
                      fontSize: 20
                    ),
                  )),
            )
          ],
        ),
      ),
    ));
  }
}
