import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  getTrains() {
    setState(() {
      getStationData().then((r) {
        result = r;
      });
    });
    if (result != null){
      return StreamBuilder(
        stream: Firestore.instance.collection('StationList').snapshots(),
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(
              hint: Text('Start station'),
              value: startStation,
              onChanged: (newValue) {
                setState(() {
                  startStation = newValue;
                });
              },
              items: ['A', 'B', 'C', 'D'].map((value) {
                return DropdownMenuItem(
                  child: new Text(value),
                  value: value,
                );
              }).toList(),
            ),
          );
        },
      );
    }
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
            DropdownButton(
              hint: Text('Start station'),
              value: startStation,
              onChanged: (newValue) {
                setState(() {
                  startStation = newValue;
                });
              },
              items: ['A', 'B', 'C', 'D'].map((value) {
                return DropdownMenuItem(
                  child: new Text(value),
                  value: value,
                );
              }).toList(),
            ),
            DropdownButton(
              hint: Text('End station'),
              value: endStation,
              onChanged: (newValue) {
                setState(() {
                  endStation = newValue;
                });
              },
              items: ['A', 'B', 'C', 'D'].map((value) {
                return DropdownMenuItem(
                  child: new Text(value),
                  value: value,
                );
              }).toList(),
            ),
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
                  startStation = newValue.toString();
                });
              },
              items: snapshot.data.documents.map((DocumentSnapshot value) {
                return DropdownMenuItem(
                  child: new Text(value.documentID),
                  value: value.documentID,
                );
              }).toList(),
            ),
          );
        },
      ),
            // StreamBuilder(
            //   stream: Firestore.instance.collection('StationList').snapshots(),
            //   builder: (context, snapshot) {
            //     var length = snapshot.data.documents.length;
            //     DocumentSnapshot ds = snapshot.data.documents[length - 1];
            //     return new Container(
            //       child: DropdownButton(
            //         hint: Text('End station'),
            //         value: endStation,
            //         onChanged: (newValue) {
            //           setState(() {
            //             endStation = newValue;
            //           });
            //         },
            //         items: snapshot.data.documents.map((DocumentSnapshot doc) {
            //           return new DropdownMenuItem<String>(
            //             value: doc.data['title'],
            //             child: new Text(doc.data['title']),
            //           );
            //         }).toList(),
            //       ),
            //     );
            //   },
            // ),

            // RaisedButton(
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(5.0)),
            //     elevation: 4.0,
            //     onPressed: () {
            //       DatePicker.showTimePicker(context, showTitleActions: true,
            //           onChanged: (time) {
            //         print('change $time');
            //       }, onConfirm: (time) {
            //         setState(() {
            //           startTime = '${time.hour}:${time.minute}';
            //         });
            //         print('confirm ${time.hour}:${time.minute}');
            //       }, currentTime: DateTime.now(), locale: LocaleType.en);
            //     },
            //     child: Text(this.startTime.toString())),
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
                      this.endTime = selectedTime.toString();
                      startTimeController.text = selectedTime.hour.toString() +
                          ':' +
                          selectedTime.minute.toString();
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
                      this.endTime = selectedTime.toString();
                      endTimeController.text = selectedTime.hour.toString() +
                          ':' +
                          selectedTime.minute.toString();
                    }
                  });
                },
              ),
            ),
            Divider(),
            MaterialButton(
              onPressed: () {},
              child: Text(
                'Test Button',
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
