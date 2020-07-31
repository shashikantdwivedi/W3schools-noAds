import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w3school/noInternet.dart';
import 'package:w3school/webviewScreens/webpage.dart';
import 'blackBox.dart';
import 'components/bottomBar.dart';
import 'components/floatingOptions.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

class Home extends StatefulWidget {
  final url;

  Home({this.url});

  @override
  _HomeState createState() => url != null ? _HomeState(url: url) : _HomeState();
}

class _HomeState extends State<Home> {
  String url;

  _HomeState({this.url});

  var internetStatus = true;

  checkInternetConnection() async {
    bool result = await DataConnectionChecker().hasConnection;
    setState(() {
      internetStatus = result;
    });
  }

  @override
  void initState() {
    checkInternetConnection();
  }

  @override
  Widget build(BuildContext context) {
    var blackBoxProvider = Provider.of<BlackBox>(context);
    return WillPopScope(
      child: internetStatus
          ? SafeArea(
              child: Scaffold(
                  bottomNavigationBar: bottomBar(blackBoxProvider, context),
                  floatingActionButton: blackBoxProvider.getPageLoaded
                      ? floatingOptions(blackBoxProvider)
                      : Container(),
                  body: Stack(
                    children: [
                      url != null ? WebPage(url: url) : WebPage(),
                      !blackBoxProvider.getPageLoaded ? Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration:
                            BoxDecoration(color: Colors.black.withOpacity(0.4)),
                        child: Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 5,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFF4CAF50)),
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ) : Container()
                    ],
                  )),
            )
          : NoInternet(),
      onWillPop: () async => false,
    );
  }
}
