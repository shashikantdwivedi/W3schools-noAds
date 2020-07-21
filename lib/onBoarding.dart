import 'package:flutter/material.dart';
import 'onBoarding/darkMode.dart';
import 'db.dart';
import 'models/settingsModel.dart';
import 'onBoarding/bookmarks.dart';
import 'onBoarding/loading.dart';
import 'onBoarding/noAds.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoarding createState() => _OnBoarding();
}

class _OnBoarding extends State<OnBoarding> {
  List<Settings> _settings = [];
  bool firstTime = false;

  void initState() {
    checkFirstUse();
  }

  void checkFirstUse() async {
    print('Checking First Use');
    List<Map<String, dynamic>> _results =
        await DB.query(Settings.table, where: 'configuration=\'FirstTime\'');
    _settings = _results.map((item) => Settings.fromMap(item)).toList();
    _settings.forEach((Settings s) async {
      if (s.value == '1') {
        print('First Time Used');
        s.value = '0';
        int updt = await DB.update(Settings.table, s);
      } else {
        print('Not First Use');
        setState(() {
          firstTime = true;
        });
      }
    });
    List<Map<String, dynamic>> _newResults = await DB.query(Settings.table);
    _settings = _newResults.map((item) => Settings.fromMap(item)).toList();
    _settings.forEach((Settings s) {
      print(s.configuration);
      print(s.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: firstTime
          ? PageView(
              scrollDirection: Axis.horizontal,
              children: [NoAds(), Bookmarks(), DarkMode()],
            )
          : Loading(),
    ));
  }
}
