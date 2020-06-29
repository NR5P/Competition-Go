import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:streetracegather/helpers/competition.dart';
import 'package:streetracegather/helpers/competitorInfo.dart';
import 'package:streetracegather/services/database.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import 'package:streetracegather/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _timerDisplay = "00:00:00";
  Color backgroundColor = Colors.grey;
  final AuthService _auth = AuthService();

  //TODO: test code
  DateTime startingTime = DateTime.parse("2020-06-29 21:47:00Z");  // 8:18pm
  //TODO: end test code

  Competition competition;

  @override
  void initState() {
    super.initState();
    competition = new Competition("first test", startingTime, "start location", "end location");
    //TODO: later this will grab from a database
    new Timer.periodic(Duration(seconds:1), (Timer t) => updateTimer());
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().competitionUsers,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              "Competition Go",
          ),
          backgroundColor: Colors.black,
          actions: [
            FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                label: Text(
                  "logout",
                  style: TextStyle(color: Colors.grey),
                )
            )
          ],
        ),
        backgroundColor: backgroundColor,
        body: buildTimerDisplay(),
        floatingActionButton: buildSpeedDial(),
      ),
    );
  }

  SpeedDial buildSpeedDial() {
    return SpeedDial(
      backgroundColor: Colors.black87,
      child: Icon(MaterialCommunityIcons.flag_checkered),
      children: [
        SpeedDialChild(
            child: Icon(Icons.beenhere),
            backgroundColor: Colors.black54,
            onTap: () => Navigator.pushNamed(context, "/enter_race"),
            label: "Enter Race",
            labelStyle: TextStyle(fontWeight: FontWeight.w500)
        ),
        SpeedDialChild(
            child: Icon(Icons.beenhere),
            backgroundColor: Colors.black38,
            onTap: () => Navigator.pushNamed(context, "/start_race"),
            label: "Start Race",
            labelStyle: TextStyle(fontWeight: FontWeight.w500)
        ),
      ],
    );
  }

  Widget buildTimerDisplay() {
    return Center(child: Text(
      _timerDisplay,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 100
      ),
    ));
  }

  void updateTimer() {
    if (this.mounted) {
      setState(() {
        _timerDisplay = competition.showCountDownTime();
        if (competition.getSecondsLeft() < 0)
          backgroundColor = Colors.green;
      });
    }
  }
}

