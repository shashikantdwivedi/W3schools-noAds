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
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => BlackBox(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Color(0xFF4CAF50),
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
