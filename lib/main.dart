import 'package:flutter/material.dart';
import 'controller/date.dart';
import 'view/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider( 
      create: (context) => Date(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Randate',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true
        ),
        home: HomePage(),
      ),
    );
  }
}
