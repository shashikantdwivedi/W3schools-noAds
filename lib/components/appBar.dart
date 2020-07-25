import 'package:flutter/material.dart';

PreferredSizeWidget appBar(String title, bool searchEnabled, context) {
  return PreferredSize(
      child: Container(
          height: 60,
          decoration: BoxDecoration(color: Theme.of(context).primaryColor, boxShadow: [
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
