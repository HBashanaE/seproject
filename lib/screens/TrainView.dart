// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:seproject/widgets/stationCard.dart';

// void main() => runApp(TrainView(this.title, 
                                      // this.name,
                                      // this.startStation, 
                                      // this.startTime, 
                                      // this.endStation, 
                                      // this.departureTime, 
                                      // this.currentLocation));

class TrainView extends StatefulWidget {  
   String name;
   String startTime;
   String departureTime;
   String startStation;
   String endStation;
   String currentLocation;
  //  String n="madhavi";

  TrainView(
    String name,
    String startTime, 
    String departureTime, 
    String startStation,
    String endStation,
    String currentLocation
  )
  {
    this.name = name ;
    this.startTime = startTime;
    this.departureTime = departureTime;
    this.startStation = startStation;
    this.endStation = endStation;
    this.currentLocation = currentLocation;
  }

  @override
  _TrainViewState createState() => _TrainViewState(
                                      this.name,
                                      this.startStation, 
                                      this.startTime, 
                                      this.endStation, 
                                      this.departureTime, 
                                      this.currentLocation
                                    );
}

class _TrainViewState extends State<TrainView> {    

   String name;
   String startTime;
   String departureTime;
   String startStation;
   String endStation;
   String currentLocation;
  //  String n="madhavi";

  _TrainViewState(
    String name,
    String startTime, 
    String departureTime, 
    String startStation,
    String endStation,
    String currentLocation
  )
  {
    this.name = name ;
    this.startTime = startTime;
    this.departureTime = departureTime;
    this.startStation = startStation;
    this.endStation = endStation;
    this.currentLocation = currentLocation;
  }
  @override
  Widget build(BuildContext context){    
    return Scaffold(
      appBar: AppBar(title: Text('Current location ')),
      body:       
      Row(
        mainAxisAlignment: MainAxisAlignment.center, 
        crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        
        Expanded(          
          flex: 2, // 20%
          child: Container(),
        ),
        Expanded(
          flex: 6, // 60%
          child: Container(
            // height: 250,
            
            child: Column(  
              mainAxisAlignment: MainAxisAlignment.center, 
              children: <Widget>[
              StationCard(
                name: currentLocation,
                current: false,
              ),
              StationCard(
                name: currentLocation,
                current: true,
              ),
             
              StationCard(
                name: 'current location',
                current: false,
              ),
            ]),
          ),
        ),
        Expanded(
          flex: 2, // 20%
          child: Container(),
        ),
      ],
    )
      
    );
  }
}