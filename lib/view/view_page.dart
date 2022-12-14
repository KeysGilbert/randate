import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randate/controller/date.dart';
import 'package:randate/controller/db_helper.dart';
import 'package:randate/model/date_model.dart';

class ViewPage extends StatefulWidget {
  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //setup controller for animations upon initialization
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

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
              return SlideTransition(
                position: Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
                    .animate(CurvedAnimation(
                        parent: _controller, curve: Curves.bounceIn)),
                child: Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.horizontal,
                    onDismissed: (direction) {
                      final dateModel =
                          DateModel(dateText: date.dateList[index]);
                          
                      //remove from list
                      date.dateList.removeAt(index);

                      //TO-DO: remove from database
                      DatabaseHelper.instance.remove(dateModel.id!);
                    },
                    child: ListTile(title: Text(date.dateList[index]))),
              );
            }),
      );
    });
  }
}
