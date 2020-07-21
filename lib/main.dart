import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w3school/onBoarding.dart';
import 'db.dart';
import 'home.dart';
import 'models/settingsModel.dart';
import 'models/bookmarksModel.dart';
import 'blackBox.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DB.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  List<Settings> _settings = [];
  bool firstTime = false;

  @override
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
    return ChangeNotifierProvider(
        create: (context) => BlackBox(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: Color(0xFF4CAF50 ),
              fontFamily: 'Gilroy Medium',
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => OnBoarding(),
            '/home': (context) => Home()
          },
        ));
  }
}
