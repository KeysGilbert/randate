import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Date {
  final _url =
      "https://www.boredapi.com/api/activity?type=recreational&participants=1";

  Future getData() async {
    var uri = Uri.parse(_url);

    //get data from BoredAPI
    var response = await http.get(uri);

    //check if successful
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return decodedData;
    } else {
      throw Exception("Could not retrive data.");
    }
  }

  
}
