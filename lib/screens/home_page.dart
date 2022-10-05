import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
              child: Text('just a placeholder',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0)),
            )),
        Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              color: Colors.white,
              child: ElevatedButton(
                onPressed: null,
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.lightBlueAccent)),
                child: Text(
                  'SPIN',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ))
      ],
    );
  }
}
