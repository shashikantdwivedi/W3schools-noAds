import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'blackBox.dart';
import 'components/bottomBar.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var blackBoxProvider = Provider.of<BlackBox>(context);
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: bottomBar(blackBoxProvider, context),
          body: Container(child: Text('Home Screen'))),
    );
  }
}
