import 'package:flutter/foundation.dart';
import 'models/settingsModel.dart';
import 'models/bookmarksModel.dart';

class BlackBox extends ChangeNotifier {
  List<Settings> _settings;
  List<Bookmarks> _bookmarks;
  bool firstTime = false;
  bool firstTimeChecked = false;

  set setFirstTime(bool val) {
    firstTimeChecked = true;
    firstTime = val;
    notifyListeners();
  }



  get getSettings {
    return _settings;
  }

  set setSettings(List<Settings> s) {
    _settings = s;
    notifyListeners();
  }

  get getBookmarks {
    return _bookmarks;
  }

  set setBookmarks(List<Bookmarks> b) {
    _bookmarks = b;
    notifyListeners();
  }
}
