import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:seproject/screens/TrainView.dart';

class TrainList extends StatelessWidget {
  TrainList ({Key key, this.title}) : super(key:key);
  final String title;

  Widget _build(BuildContext context, DocumentSnapshot documentSnapshot){
    return Card(
      
      child: Train(
        
              name: documentSnapshot['Start Station'],
              startStation: documentSnapshot['Start Station'],
              endStation: documentSnapshot['End Station'],
              startTime: documentSnapshot['Start Time'],
              departureTime: documentSnapshot['End Time'],
              currentLocation: documentSnapshot['Start Station']
            ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Train List")),
      body: StreamBuilder<QuerySnapshot>(
        
        stream: Firestore.instance.collection('TrainJourney').snapshots(),
        builder: (context, snapshot){
          if (!snapshot.hasData) return const Text('Loading...');
          return ListView.builder(
            padding: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0), 
            itemExtent: 80.0,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) => 
              _build(context, snapshot.data.documents[index]),
            
          );
         },      
      ),
    );
  }

}



class Train extends StatelessWidget {
  Train({
    Key key, 
    this.name,
    this.startTime, 
    this.departureTime, 
    this.startStation,
    this.endStation,
    this.currentLocation
  });

  final String name;
  final String startTime;
  final String departureTime;
  final String startStation;
  final String endStation;
  final String currentLocation;
  @override
  Widget build(BuildContext context) {
    return Card(
          color: Colors.white10,
          child: FlatButton(
          padding: const EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 10.0), 
          
          onPressed: ()=>{ 
            navigate(context, 
              TrainView(
                this.name,
                this.startStation, 
                this.startTime, 
                this.endStation, 
                this.departureTime, 
                this.currentLocation 
              )
            )
          },
          // child: Card(
          child: Column( 
            
            children: <Widget>[
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                
                children: <Widget> [                          
                  Text(this.startStation),
                  Text(this.startTime),
                ],
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                children: <Widget> [                          
                  Text(this.endStation),
                  Text(this.departureTime),
                ],
              )
            ],
                       

          ),
          ),
        

    );
    
  }

  navigate(context,Widget wid){
    return Navigator.push(context, MaterialPageRoute(builder: (context){
      return wid;
    }));
  }

}



