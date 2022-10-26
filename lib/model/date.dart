import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Date extends ChangeNotifier {
  final _url =
      "https://www.boredapi.com/api/activity?type=recreational&participants=1";

  late var _activityData;
  late List<dynamic> dateList = [];

  Future getData() async {
    var uri = Uri.parse(_url);

    //get data from BoredAPI
    var response = await http.get(uri);

    //check if successful
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);

      //store in list for displaying on ViewPage
    dateList = decodedData['activity'] as List;
      return decodedData;
    } else {
      throw Exception("Could not retrive data.");
    }
  }

//helper method to wait for that future data from getData()
  void awaitActivityData() async {
    //await for decoded data
    _activityData = await getData();
    notifyListeners();
  }

  dynamic get activityData => _activityData;
}
