import 'package:flutter/material.dart';
import 'package:flutter_project/profileWithProgressBar.dart';
import 'circularCharts.dart';
import 'customProgress.dart';
import 'myHomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfileWithProgressBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}


