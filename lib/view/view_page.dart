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
  late var datesFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //setup controller for animations upon initialization
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    _controller.forward();

    //store future
    datesFuture = DatabaseHelper.instance.getDates();
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
        body: FutureBuilder(
          future: datesFuture,
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (!snapshot.hasData ||
                snapshot.connectionState != ConnectionState.done) {
              return CircularProgressIndicator();
            }

            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return SlideTransition(
                    position:
                        Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
                            .animate(CurvedAnimation(
                                parent: _controller, curve: Curves.bounceIn)),
                    child: Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.horizontal,
                        background: Container(color: Colors.red),
                        onDismissed: (direction) {
                          /*
                          final dateModel =
                              DateModel(dateText: date.dateList[index]); */
                          
                          Map<String, dynamic> dateJson =
                              snapshot.data![index] as Map<String, dynamic>; 
                          DateModel dateModel = DateModel.fromMap(dateJson);

                          //remove from list
                          date.dateList.removeAt(index);

                          
                          
                          setState(() {

                            //remove from database
                            DatabaseHelper.instance.remove(dateModel.id!);

                            //update future
                            snapshot.data!.removeAt(index);
                            datesFuture = DatabaseHelper.instance.getDates();
                          });
                        },
                        child: ListTile(
                            title: Text(snapshot.data![index].toString()))),
                  );
                });
          },
        ),
      );
    });
  }
}
