import '../models/bookmarksModel.dart';
import '../db.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

bool bookmarkExists(url, bookmarks) {
  for (var x=0; x<bookmarks.length; x++) {
    if (bookmarks[x].url == url) {
      return true;
    }
  }
  return false;
}

Widget floatingOptions(blackBoxProvider) {
  var bookmarkExistence = bookmarkExists(blackBoxProvider.getCurrentURL,blackBoxProvider.getBookmarks);
  return SpeedDial(
    // both default to 16
    marginRight: 18,
    marginBottom: 20,
    animatedIcon: AnimatedIcons.menu_close,
    animatedIconTheme: IconThemeData(size: 22.0),
    // this is ignored if animatedIcon is non null
    // child: Icon(Icons.add),
    // If true user is forced to close dial manually
    // by tapping main button and overlay is not rendered.
    closeManually: false,
    curve: Curves.bounceIn,
    overlayColor: Colors.black,
    overlayOpacity: 0.5,
    onOpen: () => print('OPENING DIAL'),
    onClose: () => print('DIAL CLOSED'),
    tooltip: 'Speed Dial',
    heroTag: 'speed-dial-hero-tag',
    backgroundColor: Color(0xFF4CAF50),
    foregroundColor: Colors.white,
    elevation: 8.0,
    shape: CircleBorder(),
    children: [
      SpeedDialChild(
          child: Icon(Icons.share),
          backgroundColor: Colors.blue,
          label: 'Share',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () {
            Share.share(blackBoxProvider.getCurrentURL);
          }),
      SpeedDialChild(
        child: bookmarkExistence
            ? Icon(Icons.bookmark)
            : Icon(Icons.bookmark_border),
        backgroundColor: Colors.orange,
        label: bookmarkExistence ? 'Bookmarked' : 'Bookmark',
        labelStyle: TextStyle(fontSize: 18.0),
        onTap: () {
          if (bookmarkExistence) {
            print('Bookmark Exist');
            blackBoxProvider.removeBookmark = blackBoxProvider.getCurrentURL;
          } else {
            var newBookmark = Bookmarks(
                title: blackBoxProvider.getCurrentTitle,
                url: blackBoxProvider.getCurrentURL);
            blackBoxProvider.addBookmark = newBookmark;
            print(blackBoxProvider.getBookmarks);
          }
        },
      ),
    ],
  );
}
