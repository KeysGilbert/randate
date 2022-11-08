import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Date extends ChangeNotifier {
  final _url =
      "https://www.boredapi.com/api/activity?type=recreational&participants=1";

  late var _activityData;
  List<dynamic> dateList = [];

  Future getData() async {
    var uri = Uri.parse(_url);

    //get data from BoredAPI
    var response = await http.get(uri);

    //check if successful
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return decodedData;
    } else {
      throw Exception("Could not retrieve data.");
    }
  }

//helper method to wait for that future data from getData()
  void awaitActivityData() async {
    //await for decoded data
    _activityData = await getData();
  
    //add activity to list
    dateList.add(_activityData['activity']);
    notifyListeners();
  }

  dynamic get activityData => _activityData;
}
