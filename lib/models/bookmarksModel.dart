import 'model.dart';

class Bookmarks implements Model {
  static String table = 'Bookmarks';
  int id;
  String title;
  String url;

  Bookmarks({this.id, this.title, this.url});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {'title': title, 'url': url};

    if (id != null) {
      map['id'] = id;
    }

    return map;
  }

  static Bookmarks fromMap(Map<String, dynamic> map) {
    return Bookmarks(id: map['id'], title: map['title'], url: map['url']);
  }
}
