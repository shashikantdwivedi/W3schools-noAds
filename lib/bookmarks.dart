import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w3school/components/appBar.dart';
import 'package:w3school/components/bottomBar.dart';
import 'blackBox.dart';
import 'db.dart';

class Bookmarks extends StatefulWidget {
  @override
  _BookmarksState createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {
  List values;
  List allBookmarks;

  Dismissible bookmark(bookmarkModel, index, blackBoxProvider) {
    return Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.endToStart,
        background: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(child: Container(color: Colors.red[300])),
            Container(
              height: Size.infinite.height,
              color: Colors.red[300],
              padding: EdgeInsets.all(5.0),
              child: IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            )
          ],
        ),
        onDismissed: (direction) {
          blackBoxProvider.removeBookmark = bookmarkModel.url;
          print(allBookmarks);
        },
        child: InkWell(
          splashColor: Colors.blue,
          onTap: () {
            blackBoxProvider.setBottomBarIndex = 0;
            Navigator.pushNamed(context, '/home', arguments: bookmarkModel.url);
          },
          child: Ink(
            child: ListTile(
              leading: Text(
                (index + 1).toString(),
                style: TextStyle(
                    color: blackBoxProvider.getDarkMode
                        ? Colors.white
                        : Colors.black),
              ),
              title: Wrap(
                children: <Widget>[
                  Padding(
                    child: Text(
                      bookmarkModel.title,
                      style: TextStyle(
                          color: blackBoxProvider.getDarkMode
                              ? Colors.white
                              : Colors.black,
                          fontFamily: 'Gilroy Bold'),
                    ),
                    padding: EdgeInsets.all(5.0),
                  )
                ],
              ),
              subtitle: Wrap(
                children: <Widget>[
                  Padding(
                    child: Text(
                      bookmarkModel.url,
                      style: TextStyle(
                          color: blackBoxProvider.getDarkMode
                              ? Colors.white60
                              : Colors.black54,
                          fontFamily: 'Gilroy SemiBold'),
                    ),
                    padding: EdgeInsets.all(5.0),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    var blackBoxProvider = Provider.of<BlackBox>(context);
    return WillPopScope(
      child: SafeArea(
          child: Scaffold(
        backgroundColor:
            blackBoxProvider.getDarkMode ? Colors.black : Colors.white,
        appBar: appBar('Bookmarks', false, context),
        bottomNavigationBar: bottomBar(blackBoxProvider, context),
        body: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                height: 1,
                color: blackBoxProvider.getDarkMode
                    ? Colors.white60
                    : Colors.grey[200],
              );
            },
            itemCount: blackBoxProvider.getBookmarks.length,
            itemBuilder: (BuildContext context, int index) {
              return bookmark(blackBoxProvider.getBookmarks[index], index,
                  blackBoxProvider);
            }),
      )),
      onWillPop: () async => false,
    );
  }
}
