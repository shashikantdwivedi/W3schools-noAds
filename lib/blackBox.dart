import 'package:flutter/foundation.dart';
import 'models/settingsModel.dart';

class BlackBox extends ChangeNotifier {
  Settings _settings;
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

  set setSettings(Settings s) {
    _settings = s;
  }
}
