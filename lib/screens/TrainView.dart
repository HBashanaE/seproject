// import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
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
  
  Widget _build(BuildContext context, DocumentSnapshot document){    
    return Card(
      child: 
      StationCard(
        name: currentLocation,
        current: false,
      ),
    );

    
  //   return Scaffold(
  //     appBar: AppBar(title: Text('Current location ')),
  //     body:       
  //     Row(
  //       mainAxisAlignment: MainAxisAlignment.center, 
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //     children: <Widget>[
        
  //       Expanded(          
  //         flex: 2, // 20%
  //         child: Container(),
  //       ),
  //       Expanded(
  //         flex: 6, // 60%
  //         child: Container(
  //           child: Column(  
  //             mainAxisAlignment: MainAxisAlignment.center, 
  //             children: <Widget>[
              
  //             StationCard(
  //               name: currentLocation,
  //               current: false,
  //             ),

  //           ]),
  //         ),
  //       ),
  //       Expanded(
  //         flex: 2, // 20%
  //         child: Container(),
  //       ),
  //     ],
  //   )
      
  //   );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Train Journey")),
      body: StreamBuilder<QuerySnapshot>(
        
        stream: Firestore.instance.collection('TrainJourney').snapshots(),
        builder: (context, snapshot){
          if (!snapshot.hasData) return const Text('Loading...');
          return ListView.builder(
            padding: const EdgeInsets.fromLTRB(60.0, 20.0, 60.0, 10.0), 
            itemExtent: 80.0,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) => 
              _build(context, snapshot.data.documents[index]),
            
          );
         },      
      ),
    );
  }



  markCurrentStation(String station){
    if (station == currentLocation){
      return true;
    }
    return false;
  }
}