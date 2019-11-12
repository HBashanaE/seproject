import 'package:flutter/material.dart';
import 'package:seproject/screens/searchResultScreen.dart';
import './screens/TrainListScreen.dart';
import './screens/homeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TrainTRACK',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Home(title: 'TrainTrack v 1.0',),
      // Home(title: 'TrainTrack v 1.0',),
    );
  }
}



