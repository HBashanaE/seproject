import 'package:flutter/material.dart';
import 'package:seproject/screens/TrainView.dart';

class TrainList extends StatelessWidget {
  TrainList ({Key key, this.title}) : super(key:key);
  final String title;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Train List")),
      body:Container(
      // height: 200,
      // width: 350,
      alignment: Alignment.topCenter,
      child: ListView(
        // child: Stack(
          shrinkWrap: true, 
          
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0), 
          
          children: <Widget>[
            
            Train(
              name: 'train-1',
              startStation: 'Katubedda',
              endStation: 'koratuwa',
              startTime: '10.00am',
              departureTime: '12.30pm',
              currentLocation: 'papliyana'
            ),
            Train(
              name: 'train-2',
              startStation: 'Katubedd',
              endStation: 'koratuwa',
              startTime: '10.00am',
              departureTime: '12.30pm',
              currentLocation: 'papliyana'
            ),
            Train(
              name: 'train-2',
              startStation: 'Katubedd',
              endStation: 'koratuwa',
              startTime: '10.00am',
              departureTime: '12.30pm',
              currentLocation: 'papliyana'
            ),
            Train(
              name: 'train-3',
              startStation: 'Katubedd',
              endStation: 'koratuwa',
              startTime: '10.00am',
              departureTime: '12.30pm',
              currentLocation: 'papliyana'
            ),
            Train(
              name: 'train-4',
              startStation: 'Katubedd',
              endStation: 'koratuwa',
              startTime: '10.00am',
              departureTime: '12.30pm',
              currentLocation: 'papliyana'
            ),
            Train(
              name: 'train-5',
              startStation: 'Katubedd',
              endStation: 'koratuwa',
              startTime: '10.00am',
              departureTime: '12.30pm',
              currentLocation: 'papliyana'
            ),
            
          ],
        // )
      )
      )
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
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0), 
          
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



