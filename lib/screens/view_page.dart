import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randate/model/date.dart';

class ViewPage extends StatefulWidget {
  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //setup controller for animations upon initialization
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Date>(builder: (context, date, child) {
      return Scaffold(
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: date.dateList.length,
            itemBuilder: (context, index) {
              return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.horizontal,
                  onDismissed: (direction) {
                    date.dateList.removeAt(index);
                  },
                  child: ListTile(title: Text(date.dateList[index])));
            }),
      );
    });
  }
}
