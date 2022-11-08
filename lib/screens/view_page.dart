import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randate/model/date.dart';

class ViewPage extends StatefulWidget {
  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // I could probably do this with a regular Date object,
    // this is just me trying to get more practice with Provider, that's all.
    Provider.of<Date>(context, listen: false).awaitActivityData(); //this line may need to be removed or adjusted
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
                  child: ListTile(
                    title: Text(date.dateList[index])
                  ));
            }),
      ); 
    });
  }
}
