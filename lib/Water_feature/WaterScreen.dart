import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'dart:async';
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
  }

  Future onSelectNotification(String payload) async {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Here is your payload"),
              content: Text("Payload : $payload"),
            ));
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      Text(
                        'Remind me to drink water at: ',
                        style: kNepaliTextStyle.copyWith(letterSpacing: 0),
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(vertical: 22),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Colors.blue,
                        elevation: 3,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 4,
                                color: Colors.lightBlue,
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: TimePickerSpinner(
                            is24HourMode: false,
                            normalTextStyle: kEnglishTextStyle,
                            highlightedTextStyle: kEnglishTextStyle.copyWith(
                                color: kMainColor, fontSize: 30),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: ButtonTheme(
                          height: 60,
                          child: RaisedButton(
                              elevation: 5,
                              onPressed: () async {
                                await _scheduleNotification(_dateTime);
                                _displaySnackBar(context,
                                    snackMessage: 'Remainder set');
                              },
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 4, color: Colors.lightBlue),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                'Set Remainder',
                                style: kEnglishTextStyle.copyWith(
                                    color: kMainColor),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Divider(
                          height: 1,
                          thickness: 2,
                          color: kMainColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: ButtonTheme(
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(width: 4, color: Colors.lightBlue),
                      borderRadius: BorderRadius.circular(20)),
                  child: RaisedButton(
                    elevation: 5,
                    onPressed: () async {
                      _displaySnackBar(context,
                          snackMessage: 'You will be notified at every hour');
                      await _repeatNotification();
                    },
                    child: Text(
                      'Remind me Every Hour',
                      style: kEnglishTextStyle,
                    ),
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 15),
                  child: ButtonTheme(
                    height: 60,
                    child: RaisedButton(
                        elevation: 5,
                        onPressed: () async {
                          await flutterLocalNotificationsPlugin.cancel(0);
                          _displaySnackBar(context,
                              snackMessage:
                                  'All notifications are Cancelled!!');
                        },
                        color: Color(0xFFEB1555),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(width: 4, color: Colors.lightBlue),
                            borderRadius: BorderRadius.circular(10)),
                        child: FittedBox(
                          alignment: Alignment.center,
                          fit: BoxFit.cover,
                          child: Text(
                            'Cancel All Notification',
                            style:
                                kEnglishTextStyle.copyWith(color: kMainColor),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _displaySnackBar(BuildContext context, {String snackMessage}) {
    final snackBar = SnackBar(content: Text(snackMessage));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  Future<void> _scheduleNotification(DateTime scheduledDate) async {
    var scheduledNotificationDateTime = scheduledDate;
    // DateTime.now().add(Duration(seconds: 5));

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your other channel id',
      'your other channel name',
      'your other channel description',
      importance: Importance.Max,
      priority: Priority.High,
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    NotificationDetails platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.schedule(
        0,
        'Please drink water',
        'Water drinking remainder',
        scheduledNotificationDateTime,
        platformChannelSpecifics);
    print('Scheduled notification dateTime is ${DateTime.now()}');
  }

  Future<void> _repeatNotification() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'repeating channel id',
        'repeating channel name',
        'repeating description');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.periodicallyShow(0, 'repeating title',
        'repeating body', RepeatInterval.Hourly, platformChannelSpecifics);
  }
}
