import 'package:flutter/material.dart';
import 'onBoarding.dart';
import 'home.dart';
import 'startScreen.dart';
import 'settings.dart';
import 'settings/reportProblem.dart';
import 'bookmarks.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/': return MaterialPageRoute(builder: (context) => OnBoarding());
    case '/home' : if (settings.arguments is String) {
      print(settings.arguments);
      return MaterialPageRoute(builder: (context) => Home(url: settings.arguments));
    }
    return MaterialPageRoute(builder: (context) => Home());
    case '/startScreen': return MaterialPageRoute(builder: (context) => StartScreen());
    case '/settings': return MaterialPageRoute(builder: (context) => Settings());
    case '/reportProblem': return MaterialPageRoute(builder: (context) => ReportProblem());
    case '/bookmarks': return MaterialPageRoute(builder: (context) => Bookmarks());
  }
}