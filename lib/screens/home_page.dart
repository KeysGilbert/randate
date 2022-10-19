import 'dart:async';
import 'package:flutter/material.dart';
import 'package:randate/popupmenu.dart';
import 'package:randate/screens/result_page.dart';
import 'package:randate/screens/view_page.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StreamController<int> controller =
      StreamController<int>(); //used for controlling the fortune wheel

  List<String> items = ["???", "???", "???", "???", "???", "???"];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              flex: 4,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color(0xffff4d4d),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0))),
                child: Column(
                  children: <Widget>[
                    SafeArea(child: PopupMenu()),
                    Expanded(
                      child: Center(
                        child: Container(
                          width: 300,
                          height: 300,
                          child: FortuneWheel(
                            animateFirst: false,
                            duration: Duration(seconds: 3),
                            selected: controller.stream,
                            items: [
                              for (int i = 0;
                                  i < items.length;
                                  i++) ...<FortuneItem>{
                                FortuneItem(
                                    child: Text(items[i]
                                        .toString())), //populate list of fortune items
                              },
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                color: Colors.white,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      controller.add(Fortune.randomInt(
                          0, items.length)); //random value from items list
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ResultPage()));
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.lightBlueAccent),
                      fixedSize: MaterialStateProperty.all<Size>(Size(100, 50)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0))),
                      elevation: MaterialStateProperty.all<double>(10.0)),
                  child: Text(
                    'SPIN',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
