import 'model.dart';

class Settings implements Model {
  static String table = 'Settings';
  int id;
  String configuration;
  String value;

  Settings({this.id, this.configuration, this.value});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {'configuration': configuration, 'value': value};

    if (id != null) {
      map['id'] = id;
    }

    return map;
  }

  static Settings fromMap(Map<String, dynamic> map) {
    return Settings(
        id: map['id'],
        configuration: map['configuration'],
        value: map['value'].toString());
  }
}
