import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'screens/view_page.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Platform.isIOS
          ? CupertinoActionSheet() //will fill in later
          : PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(value: 1, child: Text('View')),
                    PopupMenuItem(value: 2, child: Text('Add'))
                  ],
              onSelected: (value) {
                switch (value) {
                  case 1:
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => ViewPage())));
                    break;
                  case 2:
                    null; //will fill in later for adding to list of dates
                    break;
                }
              }),
    );
  }
}
