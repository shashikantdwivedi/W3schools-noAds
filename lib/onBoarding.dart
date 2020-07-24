import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w3school/blackBox.dart';
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

  void checkFirstUse(blackBox) async {
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
        blackBox.setFirstTime = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var blackBox = Provider.of<BlackBox>(context);
    if (!blackBox.firstTimeChecked) {
      checkFirstUse(blackBox);
    }
    return SafeArea(
        child: Scaffold(
      body: blackBox.firstTime
          ? PageView(
              scrollDirection: Axis.horizontal,
              children: [NoAds(), Bookmarks(), DarkMode()],
            )
          : Loading(),
    ));
  }
}
