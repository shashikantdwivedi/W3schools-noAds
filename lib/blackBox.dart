import 'package:flutter/foundation.dart';
import 'models/settingsModel.dart';
import 'models/bookmarksModel.dart';
import 'package:webview_flutter/webview_flutter.dart';


class BlackBox extends ChangeNotifier {
  List<Settings> _settings;
  List<Bookmarks> _bookmarks;
  WebViewController _controller;
  bool firstTime = false;
  bool firstTimeChecked = false;
  int _bottomBarIndex = 0;
  String _currentURL = '';
  String _currentTitle = '';
  bool _pageLoaded = false;
  bool _darkMode = false;
  bool _ads = false;

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

  get getBottomBarIndex {
    return _bottomBarIndex;
  }

  set setBottomBarIndex(index) {
    _bottomBarIndex = index;
    notifyListeners();
  }

  get getController {
    return _controller;
  }

  set setController(controller) {
    _controller = controller;
    notifyListeners();
  }

  get getCurrentURL{
    return _currentURL;
  }

  set setCurrentURL(url) {
    _currentURL = url;
    notifyListeners();
  }

  get getPageLoaded {
    return _pageLoaded;
  }

  set setPageLoaded(val) {
    _pageLoaded = val;
    notifyListeners();
  }

  get getCurrentTitle{
    return _currentTitle;
  }

  set setCurrentTitle(title) {
    _currentTitle = title;
    notifyListeners();
  }

  get getDarkMode{
    return _darkMode;
  }

  set setDarkMode(val) {
    if (val is String) {
      if (int.parse(val) == 0) {
        _darkMode = false;
      } else {
        _darkMode = true;
      }
    } else {
      _darkMode = val;
    }
    notifyListeners();
  }

  get getAds{
    return _ads;
  }

  set setAds(val) {
    _ads = val;
    notifyListeners();
  }

}
