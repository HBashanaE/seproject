import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//       return MaterialApp(
//          title: 'Flutter Demo', 
//          theme: ThemeData(
//             primarySwatch: Colors.blue,
//          ), 
//          home: TrainList(title: 'Product layout demo home page'), 
//       );
//    }
// }

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
            )
          ],
        // )
      )
    );
  }
}

class Train extends StatelessWidget{
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

  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.all(2),
      height: 140,
      width: 200,
      child: Card(        
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
                          Text(this.name),
                        ],
                      ),

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

            // Expanded(
            //   child: Container(
            //     padding: EdgeInsets.all(5),
            //     child: Column(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: <Widget>[                      
            //           Text(this.name),
            //           // Padding(
            //           //   padding: const EdgeInsets.all(8.0),  
            //           Expanded(
            //             child: Card(
            //               child: Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: <Widget>[
            //                   Text(this.startStation),
            //                   Text(this.startTime),
            //                 ],                          
            //               ),
            //             ),
                        
            //           ),
            //           Expanded(
            //             child: Card(
            //               child: Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: <Widget>[
            //                   Text(this.endStation),
            //                   Text(this.departureTime),
            //                 ],                          
            //               ),
            //             ),
              
                      // )
                  ],
                )
              )
          );  
  }
  
}
