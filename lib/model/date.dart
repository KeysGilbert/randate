import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Date {
  List _dates = [];

  //Even though some are meant for 1 participant, most can easily be done with a partner
  var _uri = Uri.parse(
      "https://www.boredapi.com/api/activity?type=recreational&participants=1");

  Future<http.Response> getData() async {
    //get data from BoredAPI
    final response = await http.get(_uri);

    //check if successful
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Data could not be fetched!");
    }
  }

  
}
