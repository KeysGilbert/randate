import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randate/controller/date.dart';
import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';

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
      appBar: AppBar(),
      body: Center(
        child: Consumer<Date>(
          builder: (context, date, child) => AnimatedTextKit(animatedTexts: [
            TyperAnimatedText(
                date.dateList[Random().nextInt(date.dateList.length)])
          ]),
        ),
      ),
    );
  }
}
