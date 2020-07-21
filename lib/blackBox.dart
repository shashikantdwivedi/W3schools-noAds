import 'package:flutter/foundation.dart';
import 'models/settingsModel.dart';

class BlackBox extends ChangeNotifier {
  Settings _settings;

  get getSettings {
    return _settings;
  }

  set setSettings(Settings s) {
    _settings = s;
  }
}
