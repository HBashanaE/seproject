import 'package:flutter/material.dart';
// import 'package:seproject/screens/searchResultScreen.dart';
import './screens/TrainListScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return GestureDetector( 
    //     child: ProductBox(item: items[index]), 
    //     onTap: () { 
    //       Navigator.push( 
    //           context, MaterialPageRoute( 
    //             builder: (context) => ProductPage(item: items[index]), 
    //           ), 
    //       ); 
    //     }, 
    // ); 
    return MaterialApp(
      title: 'TrainTRACK',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: TrainList(),
    );
  }
}

