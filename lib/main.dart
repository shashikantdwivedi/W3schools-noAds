import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w3school/onBoarding.dart';
import 'db.dart';
import 'home.dart';
import 'models/settingsModel.dart';
import 'models/bookmarksModel.dart';
import 'blackBox.dart';
import 'package:device_preview/device_preview.dart';
import 'startScreen.dart';
import 'settings.dart' as SettingsPage;
import 'settings/reportProblem.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'routing.dart';

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) {
  if (message.containsKey('data')) {
    // Handle data message
    final dynamic data = message['data'];
  }

  if (message.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = message['notification'];
  }

  // Or do other work.
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DB.init();
  runApp(
    DevicePreview(
      enabled: kReleaseMode,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  String _message = '';
  String token = '';
  final FirebaseMessaging _fcm = FirebaseMessaging();

  _register() {
    _fcm.getToken().then((_token) {
      token = _token;
      print(_token);
    });
  }

  @override
  void initState() {
    super.initState();
    _register();
    getMessage();
  }

  void sendNotification() {}

  void getMessage() {
    _fcm.configure(
        onMessage: (Map<String, dynamic> message) async {
          print('on message $message');
          setState(() => _message = message["notification"]["title"]);
        },
        onBackgroundMessage: myBackgroundMessageHandler,
        onResume: (Map<String, dynamic> message) async {
          print('on resume $message');
          setState(() => _message = message["notification"]["title"]);
        },
        onLaunch: (Map<String, dynamic> message) async {
          print('on launch $message');
          setState(() => _message = message["notification"]["title"]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => BlackBox(),
        child: MaterialApp(
          locale: DevicePreview.of(context).locale,
          // <--- Add the locale
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: Color(0xFF4CAF50),
              fontFamily: 'Gilroy Medium'),
          initialRoute: '/',
          onGenerateRoute: generateRoute,
        ));
  }
}
