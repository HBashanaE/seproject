import 'package:flutter/material.dart';
import 'package:seproject/screens/TrainView.dart';

class TrainList extends StatelessWidget {
  TrainList ({Key key, this.title}) : super(key:key);
  final String title;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Train List")),
      body: ListView(
        // child: Stack(
          shrinkWrap: true, 
          padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0), 
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
              name: 'train-1',
              startStation: 'Katubedd',
              endStation: 'koratuwa',
              startTime: '10.00am',
              departureTime: '12.30pm',
              currentLocation: 'papliyana'
            ),
            Train(
              name: 'train-1',
              startStation: 'Katubedd',
              endStation: 'koratuwa',
              startTime: '10.00am',
              departureTime: '12.30pm',
              currentLocation: 'papliyana'
            ),
            Train(
              name: 'train-1',
              startStation: 'Katubedd',
              endStation: 'koratuwa',
              startTime: '10.00am',
              departureTime: '12.30pm',
              currentLocation: 'papliyana'
            ),
            Train(
              name: 'train-1',
              startStation: 'Katubedd',
              endStation: 'koratuwa',
              startTime: '10.00am',
              departureTime: '12.30pm',
              currentLocation: 'papliyana'
            ),
            Train(
              name: 'train-1',
              startStation: 'Katubedd',
              endStation: 'koratuwa',
              startTime: '10.00am',
              departureTime: '12.30pm',
              currentLocation: 'papliyana'
            ),
            
          ],
        // )
      )
    );
  }
}

class Train1 extends StatelessWidget{
  Train1({
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

  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () 
      {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TrainView(

          "", 
                                      this.name,
                                      this.startStation, 
                                      this.startTime, 
                                      this.endStation, 
                                      this.departureTime, 
                                      this.currentLocation
        )),
      );
      },
      child: Container(
      padding: EdgeInsets.all(2),
      height: 100,
      width: 150,
      color: Colors.blue,
      child: Card(   
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded( 
              child: Container( 
                padding: EdgeInsets.all(5), 
                child: Column(    
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
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
                      ),
                                      
                    ], 
                )
              )
          )
                  ],
                )
              )
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
        color: Colors.grey,
        child: FlatButton(
          
          onPressed: ()=>{
            navigate(context, TrainView(
                                      "",
                                      this.name,
                                      this.startStation, 
                                      this.startTime, 
                                      this.endStation, 
                                      this.departureTime, 
                                      this.currentLocation 
                                    ))
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
                  Text(this.startStation),
                  Text(this.startTime),
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



