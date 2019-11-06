import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TrainTRACK',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(title: 'TrainTRACK'),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String startStation;
  String endStation;
  String startTime;
  String endTime;
  Future selectedTime;

  @override
  void initState() {
    setState(() {
      startTime = 'Not yet selected';
      endTime = 'Not yet selected';
    });
    super.initState();
  }

  Future<TimeOfDay> _selectTime(BuildContext context) {
    return showTimePicker(
        initialTime: TimeOfDay(hour: TimeOfDay.now().hour, minute: TimeOfDay.now().minute),
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            DropdownButton(
              hint: Text('Please choose a start station'),
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
              hint: Text('Please choose a end station'),
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
            
            // MaterialButton(
            //   onPressed: () {
            //     Future selectedTime = showTimePicker(
            //       initialTime: TimeOfDay.now(),
            //       context: context,
            //     );
            //     print(selectedTime.toString());
            //   },
            //   child: Text(
            //     'Test Button',
            //   ),
            //   color: Colors.black,
            //   textColor: Colors.white,
            // ),
            MaterialButton(
              onPressed: () async {
                final selectedTime = await _selectTime(context);
                print(selectedTime);
              },
              child: Text(
                'Date Time Picker',
              ),
              color: Colors.black,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Profile'))
        ],
      ),
    );
  }
}