import 'package:flutter/material.dart';

class StartRace extends StatefulWidget {
  @override
  _StartRaceState createState() => _StartRaceState();
}

class _StartRaceState extends State<StartRace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Start A Race"),
        centerTitle: true,
      ),
      body: SafeArea(child: Text("start race"))
    );
  }
}

