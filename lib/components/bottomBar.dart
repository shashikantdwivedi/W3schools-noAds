import 'package:flutter/material.dart';

void navigation(index, context) {
  if (index == 3) {
    Navigator.pushNamed(context, '/settings');
  }
}

Widget bottomBar(blackBoxProvider, context) {
  return Container(
      height: 60,
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 6)]),
      child: BottomNavigationBar(
        currentIndex: blackBoxProvider.getBottomBarIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text('Search')),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark), title: Text('Bookmarks')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text('Settings'))
        ],
        onTap: (index) {
          blackBoxProvider.setBottomBarIndex = index;
          navigation(index, context);
        },
      ));
}
