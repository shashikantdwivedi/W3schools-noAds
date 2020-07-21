import 'package:flutter/foundation.dart';
import 'models/settingsModel.dart';

class BlackBox extends ChangeNotifier {
  Settings _settings;
  bool firstTime = false;

  set setFirstTime(bool val) {
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
