import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:randate/view/view_page.dart';
import 'package:randate/view/add_date_page.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Platform.isIOS
          ? CupertinoActionSheet(
              actions: [
                CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ViewPage()));
                    },
                    child: Text("View")),
                CupertinoActionSheetAction(
                  onPressed: (() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddDatePage()));
                  }),
                  child: Text("Add"),
                )
                //second option could be another sheet?
              ],
            )
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
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => SafeArea(child: AddDatePage()));
                    break;
                }
              }),
    );
  }
}
