import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StationCard extends StatelessWidget {
  StationCard({
    Key key, 
    this.name,
    this.current
  });

  final String name;  
  final bool current;

  @override
  Widget build(BuildContext context) {
    return Card(
          color: backgroundColor(current),
          child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                
                children: <Widget>[
                  
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.all(15.0),
                    height: 70.0,
                    child: Center(
                      child: 
                      Text(
                        // widget.startStation,
                        this.name,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54 ,
                        ),
                      ),
                    ),
                  ),
                  
                ],
              ),

    );
    
  }

  navigate(context,Widget wid){
    return Navigator.push(context, MaterialPageRoute(builder: (context){
      return wid;
    }));
  }

  backgroundColor(bool color){
    Color colorName;
    if (color == true){
        colorName= Colors.blueGrey;
    }
    else{
      colorName = Colors.white10;
    }
    return colorName;
  }
}