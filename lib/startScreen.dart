import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w3school/home.dart';
import 'package:w3school/models/bookmarksModel.dart';
import 'db.dart';
import 'models/settingsModel.dart';
import 'blackBox.dart';

class StartScreen extends StatefulWidget {
  StartScreen({Key key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  void handleTimeout() {
    Navigator.of(context).pushReplacement(
        new MaterialPageRoute(builder: (BuildContext context) => Home()));
  }

  startTimeout() async {
    var duration = const Duration(seconds: 2);
    return new Timer(duration, handleTimeout);
  }

  @override
  void initState() {
    startTimeout();
  }

  void loadSettings(blackBoxProvider) async {
    List<Settings> allSettings = [];
    List<Map<String, dynamic>> _results = await DB.query(Settings.table);
    _results.forEach((element) {
      allSettings.add(Settings.fromMap(element));
    });
    print(allSettings);
    blackBoxProvider.setSettings = allSettings;
    blackBoxProvider.setDarkMode = allSettings[1].value;
  }

  void loadBookmarks(blackBoxProvider) async {
    List<Bookmarks> allBookmarks = [];
    List<Map<String, dynamic>> _results = await DB.query(Bookmarks.table);
    _results.forEach((element) {
      allBookmarks.add(Bookmarks.fromMap(element));
    });
    print(allBookmarks);
    blackBoxProvider.setBookmarks = allBookmarks;
  }

  @override
  Widget build(BuildContext context) {
    var blackBoxProvider = Provider.of<BlackBox>(context);
    if (blackBoxProvider.getSettings == null) {
      loadSettings(blackBoxProvider);
    } else if (blackBoxProvider.getBookmarks == null) {
      loadBookmarks(blackBoxProvider);
    }
    return SafeArea(
      child: Scaffold(
          body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('W3Schools',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Gilroy Bold',
                    fontSize: 40,
                    color: Theme.of(context).primaryColor)),
            Text('(No Ads)',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Gilroy SemiBold',
                    fontSize: 30,
                    color: Colors.blue)),
          ],
        )),
      )),
    );
  }
}
