// import 'dart:async';

import 'package:flutter/material.dart';

// void main() => runApp(TrainView(this.title, 
                                      // this.name,
                                      // this.startStation, 
                                      // this.startTime, 
                                      // this.endStation, 
                                      // this.departureTime, 
                                      // this.currentLocation));

class TrainView extends StatefulWidget {  
   String title;
   String name;
   String startTime;
   String departureTime;
   String startStation;
   String endStation;
   String currentLocation;
  //  String n="madhavi";

  TrainView(
    String title,
    String name,
    String startTime, 
    String departureTime, 
    String startStation,
    String endStation,
    String currentLocation
  )
  {
    this.title = title;
    this.name = name ;
    this.startTime = startTime;
    this.departureTime = departureTime;
    this.startStation = startStation;
    this.endStation = endStation;
    this.currentLocation = currentLocation;
  }

  @override
  _TrainViewState createState() => _TrainViewState(
                                      this.title, 
                                      this.name,
                                      this.startStation, 
                                      this.startTime, 
                                      this.endStation, 
                                      this.departureTime, 
                                      this.currentLocation
                                    );
}

class _TrainViewState extends State<TrainView> {    

   String title;
   String name;
   String startTime;
   String departureTime;
   String startStation;
   String endStation;
   String currentLocation;
  //  String n="madhavi";

  _TrainViewState(
    String title,
    String name,
    String startTime, 
    String departureTime, 
    String startStation,
    String endStation,
    String currentLocation
  )
  {
    this.title = title;
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
      appBar: AppBar(title: Text("Train List")),
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
            height: 250,
            
            color: Colors.blueGrey,
            child: Column(  
              mainAxisAlignment: MainAxisAlignment.center, 
              children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                
                children: <Widget>[
                  
                  Container(
                    margin: const EdgeInsets.all(30.0),
                    padding: const EdgeInsets.all(10.0),
                    // color: Colors.redAccent,
                    // width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    child: Center(
                      child: 
                      Text(
                        // widget.startStation,
                        this.currentLocation,
                        style: TextStyle(
                          fontSize: 36.0,
                          
                          color: Colors.black54 ,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    // color: Colors.blueAccent,
                    // width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    child: Center(
                      child: Text(
                        'current location',
                        style: TextStyle(
                          fontSize: 18.0, 
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ],
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