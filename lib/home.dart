import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w3school/webviewScreens/webpage.dart';
import 'blackBox.dart';
import 'components/bottomBar.dart';
import 'components/floatingOptions.dart';


class Home extends StatefulWidget {
  final url;
  Home({this.url});
  @override
  _HomeState createState() => url != null ? _HomeState(url: url) : _HomeState();
}

class _HomeState extends State<Home> {
  String url;
  _HomeState({this.url});


  @override
  Widget build(BuildContext context) {
    var blackBoxProvider = Provider.of<BlackBox>(context);
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: bottomBar(blackBoxProvider, context),
          floatingActionButton: blackBoxProvider.getPageLoaded ? floatingOptions(blackBoxProvider) : Container(),
          body: url != null ? WebPage(url: url) : WebPage()),
    );
  }
}
