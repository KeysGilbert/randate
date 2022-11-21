import 'package:flutter/material.dart';

class AddDatePage extends StatelessWidget {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Add Date",
              style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            TextField(
              controller: _controller,
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: "What shall we do?"),
            )
          ],
        ),
      ),
    );
  }
}
