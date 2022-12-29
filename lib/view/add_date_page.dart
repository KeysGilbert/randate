import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randate/controller/date.dart';
import 'package:randate/controller/db_helper.dart';
import 'package:randate/model/date_model.dart';

class AddDatePage extends StatefulWidget {
  @override
  State<AddDatePage> createState() => _AddDatePageState();
}

class _AddDatePageState extends State<AddDatePage> {
  final _controller = TextEditingController();

  late String newDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Add Date",
                style: TextStyle(
                    color: Color.fromARGB(255, 180, 207, 219),
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
                  onPressed: () async {
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

                    //add input to database
                    await DatabaseHelper.instance.add(DateModel(dateText: newDate));
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
      ),
    );
  }
}
