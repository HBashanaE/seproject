import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seproject/screens/TrainListScreen.dart';

import './trainDetailsScreen.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _selected;
  String startStation;
  String endStation;
  String startTime;
  String endTime;
  Future selectedTime;
  Stream result;
  var startTimeController = TextEditingController();
  var endTimeController = TextEditingController();
  final databaseReference = Firestore.instance;

  @override
  void initState() {
    setState(() {
      getStationData().then((r) {
        result = r;
      });
      startTime = 'Not yet selected';
      endTime = 'Not yet selected';
    });
    super.initState();
  }

  getStationData() async {
    // Future<QuerySnapshot> data = Firestore.instance.collection('TrainJourney').getDocuments();
    // var data = databaseReference.collection('TrainJourney').getDocuments();

    return await Firestore.instance.collection('StationList').snapshots();

    // var x = Firestore.instance
    //     .collection('TrainJourney')
    //     .where("End Station", isEqualTo: "Panadura")
    //     .snapshots()
    //     .listen(
    //         (data) => data.documents.forEach((doc) => print(doc.documentID)));

    // var then = databaseReference
    //     .collection("TrainJourney").getDocuments()
    //     .then((QuerySnapshot snapshot) {
    //   snapshot.documents.forEach((f) => print('${f.data}}'));
    // });
  }

  Future<TimeOfDay> _selectTime(BuildContext context) {
    return showTimePicker(
      initialTime:
          TimeOfDay(hour: TimeOfDay.now().hour, minute: TimeOfDay.now().minute),
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Hasitha Bashana Elikewela"),
              accountEmail: new Text('hbashanae@gmail.com'),
              currentAccountPicture: new GestureDetector(
                  child: new CircleAvatar(
                backgroundImage: new NetworkImage(
                    'https://www.w3schools.com/w3images/avatar2.png'),
              )),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: NetworkImage(
                        'https://static.toiimg.com/photo/63463579/.jpg'),
                    fit: BoxFit.fill),
              ),
            ),
            new ListTile(
              title: new Text('Hasitha Bashana Elikewela'),
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('StationList').snapshots(),
              builder: (context, snapshot) {
                var length = snapshot.data.documents.length;
                DocumentSnapshot ds = snapshot.data.documents[length - 1];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    hint: Text('Start station'),
                    value: startStation,
                    onChanged: (newValue) {
                      setState(() {
                        startStation = newValue;
                      });
                      print(startStation);
                    },
                    items:
                        snapshot.data.documents.map((DocumentSnapshot value) {
                      return DropdownMenuItem(
                        child: new Text(value.documentID),
                        value: value.documentID,
                      );
                    }).toList(),
                  ),
                );
              },
            ),
            StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('StationList').snapshots(),
              builder: (context, snapshot) {
                var length = snapshot.data.documents.length;
                DocumentSnapshot ds = snapshot.data.documents[length - 1];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    hint: Text('End station'),
                    value: endStation,
                    onChanged: (newValue) {
                      setState(() {
                        endStation = newValue;
                      });
                      print(endStation);
                    },
                    items:
                        snapshot.data.documents.map((DocumentSnapshot value) {
                      return DropdownMenuItem(
                        child: new Text(value.documentID),
                        value: value.documentID,
                      );
                    }).toList(),
                  ),
                );
              },
            ),
            Container(
              width: 100,
              child: TextField(
                controller: startTimeController,
                decoration: InputDecoration(labelText: 'Select start time'),
                onTap: () async {
                  final selectedTime = await _selectTime(context);
                  // print(selectedTime);

                  setState(() {
                    if (selectedTime != null) {
                      var h;
                      var m;
                      h = selectedTime.hour.toString();
                      m = selectedTime.minute.toString();
                      if(selectedTime.hour<9){
                        h = '0'+ selectedTime.hour.toString();
                      }
                      if(selectedTime.minute<9){
                        m = '0' + selectedTime.minute.toString();
                      }
                      this.startTime = '${h} :  ${m}';
                      startTimeController.text ='${h} :  ${m}' ;
                    }
                  });
                },
              ),
            ),
            Container(
              width: 100,
              child: TextField(
                controller: endTimeController,
                decoration: InputDecoration(labelText: 'Select end time'),
                onTap: () async {
                  final selectedTime = await _selectTime(context);
                  // print(selectedTime);

                  setState(() {
                    if (selectedTime != null) {
                      var h;
                      var m;
                      h = selectedTime.hour.toString();
                      m = selectedTime.minute.toString();
                      if(selectedTime.hour<9){
                        h = '0'+ selectedTime.hour.toString();
                      }
                      if(selectedTime.minute<9){
                        m = '0' + selectedTime.minute.toString();
                      }
                      this.endTime = '${h} :  ${m}';
                      endTimeController.text ='${h} :  ${m}' ;
                    }
                  });
                },
              ),
            ),
            Divider(),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TrainList()),
                );
              },
              child: Text(
                'Search Trains',
              ),
              color: Colors.black,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
