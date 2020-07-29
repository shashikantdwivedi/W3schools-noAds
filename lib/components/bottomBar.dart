import 'package:flutter/material.dart';
import '../webviewScreens/search.dart';

void navigation(index, context, blackBoxProvider) {
  if (index == 4) {
    Navigator.pushNamed(context, '/settings');
  } else if (index == 0) {
    Navigator.pushNamed(context, '/home');
  } else if (index == 2) {
    blackBoxProvider.getController.loadUrl(blackBoxProvider.getCurrentURL);
  } else if (index == 1) {
    toggleSearch(blackBoxProvider);
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
        backgroundColor: blackBoxProvider.getDarkMode ? Colors.black : Color(0xFF4CAF50),
        selectedItemColor: blackBoxProvider.getDarkMode ? Color(0xFF4CAF50) : Colors.black,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text('Search')),
          BottomNavigationBarItem(
              icon: Icon(Icons.refresh), title: Text('Refresh')),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark), title: Text('Bookmarks')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text('Settings'))
        ],
        onTap: (index) {
          blackBoxProvider.setBottomBarIndex = index;
          navigation(index, context, blackBoxProvider);
        },
      ));
}
