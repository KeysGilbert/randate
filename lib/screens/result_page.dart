import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randate/model/date.dart';
import 'dart:math';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<Date>(context, listen: false).awaitActivityData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<Date>(
            builder: (context, date, child) =>
                Text(date.dateList[Random().nextInt(date.dateList.length)])),
      ),
    );
  }
}
