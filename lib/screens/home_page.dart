import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
                    SafeArea(
                      child: Align(
                          alignment: Alignment.topRight,
                          child: PopupMenuButton(
                            itemBuilder: (context) => [
                              PopupMenuItem(value: 1, child: Text('View')),
                              PopupMenuItem(value: 2, child: Text('Add'))
                            ],
                          )),
                    ),
                    Expanded(
                      child: Center(
                        child: Text('just a placeholder',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0)),
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
                  onPressed: null,
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
