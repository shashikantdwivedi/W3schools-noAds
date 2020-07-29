import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w3school/blackBox.dart';

PreferredSizeWidget appBar(String title, bool searchEnabled, context) {
  var blackBoxProvider = Provider.of<BlackBox>(context);
  return PreferredSize(
      child: Container(
          height: 60,
          decoration: BoxDecoration(color:  blackBoxProvider.getDarkMode ? Colors.black : Color(0xFF4CAF50), boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 6
            )
          ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(title,
                      style: TextStyle(
                          fontFamily: 'Gilroy Bold',
                          fontSize: 20,
                          color: Colors.white))),
              searchEnabled ? Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
              ) : Container()
            ],
          )),
      preferredSize: Size.fromHeight(60));
}
