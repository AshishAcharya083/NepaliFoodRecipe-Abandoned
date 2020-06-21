import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'dart:async';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

import 'package:food/constants.dart';

class WaterScreen extends StatefulWidget {
  @override
  _WaterScreenState createState() => _WaterScreenState();
}

class _WaterScreenState extends State<WaterScreen> {
  DateTime _dateTime = DateTime.now();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  double radioTimer;

  @override
  initState() {
    super.initState();

    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    // If you have skipped STEP 3 then change app_icon to @mipmap/ic_launcher
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
        

        _scheduleNotification();
  }

  Future onSelectNotification(String payload) async {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Here is your payload"),
              content: Text("Payload : $payload"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 5,
          automaticallyImplyLeading: true,
          titleSpacing: 0,
          title: Text(
            'Water Drinking Remainder',
            style: kEnglishTextStyle,
          ),
          backgroundColor: Color(0xFF377A98),
          iconTheme: IconThemeData(
            color: kMainColor,
            size: 30,
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF244A80), Color(0xFF377A98)],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: ListView(
                  children: <Widget>[
                    Text(
                      'Remind me to drink water at: ',
                      style: kNepaliTextStyle.copyWith(letterSpacing: 0),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.blue,
                      elevation: 3,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Colors.lightBlue,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        child: TimePickerSpinner(
                          is24HourMode: false,
                          normalTextStyle:
                              TextStyle(fontSize: 24, color: Colors.black),
                          highlightedTextStyle:
                              TextStyle(fontSize: 24, color: Colors.yellow),
                          spacing: 50,
                          itemHeight: 80,
                          isForce2Digits: true,
                          onTimeChange: (time) {
                            setState(() {
                              _dateTime = time;
                              
                            });
                          },
                        ),
                      ),
                    ),
                    FlatButton(
                        onPressed: () async{
                          // _showNotificationWithDefaultSound();
                          await _scheduleNotification();
                        },
                        child: Text('show notification')),
                    Text('Remind me in every: '),
                    CustomCheckBoxGroup(
                      elevation: 5,
                      buttonColor: Theme.of(context).canvasColor,
                      buttonLables: [
                        "30 min",
                        "1 hour",
                        "1.5 hours",
                        "2 hours",
                        "3 hours",
                        "4 hours",
                        "5 hours",
                      ],
                      buttonValuesList: [
                        "30",
                        "60",
                        "90",
                        "120",
                        "180",
                        "240",
                        "290",
                      ],
                      checkBoxButtonValues: (values) {
                        print('initial value $values');

                        if (values.isNotEmpty) {
                          values.removeRange(0, values.length - 1);
                        }
                      },
                      defaultSelected: "Monday",
                      horizontal: false,
                      width: 150,
                      height: 40,
                      enableShape: true,
                      selectedColor: kMainColor,
                      padding: 7,
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _scheduleNotification() async{
    
    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(seconds: 5));
        
var androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
  
      'your other channel id',
        'your other channel name', 'your other channel description',
        importance: Importance.Max,
        priority: Priority.High,
        );
var iOSPlatformChannelSpecifics =
    IOSNotificationDetails();
NotificationDetails platformChannelSpecifics = NotificationDetails(
    androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
await flutterLocalNotificationsPlugin.schedule(
  
    0,
    'scheduled title',
    'scheduled body',
    
    scheduledNotificationDateTime,
    platformChannelSpecifics);
  }

  Future _showNotificationWithDefaultSound() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'Notification_channel_id',
        'channel Name',
        'Here we will put the description about the channel',
        importance: Importance.Max,
        priority: Priority.High);

    var iOSPlatformChannelSpecifics =
        new IOSNotificationDetails(presentSound: false);
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      'DRINK WATER',
      'Hidrate youself',
      platformChannelSpecifics,
      payload: 'No_Sound',
    );
  }
}
