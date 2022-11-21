import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randate/model/date.dart';

class AddDatePage extends StatelessWidget {
  final _controller = TextEditingController();
  late String newDate;

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
            SizedBox(
              width: 15.0,
              height: 15.0,
            ),
            TextField(
              controller: _controller,
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: "What shall we do?"),
              onChanged: (value) {
                newDate = value; //store inputted text
              },
            ),
            TextButton(
                onPressed: () {
                  _controller.clear();

                  //add input to list of dates
                  Provider.of<Date>(context, listen: false)
                      .dateList
                      .add(newDate);

                  //show snackbar notifying that date was added
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.black12,
                      content: Text("Date added!")));
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                ),
                child: Text("Add",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)))
          ],
        ),
      ),
    );
  }
}
