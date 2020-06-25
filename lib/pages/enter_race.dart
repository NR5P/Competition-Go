import 'package:flutter/material.dart';

class EnterRace extends StatefulWidget {
  @override
  _EnterRaceState createState() => _EnterRaceState();
}

class _EnterRaceState extends State<EnterRace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Enter a Race"),
          centerTitle: true,
        ),
        body: Center(child: TextField(
          cursorColor: Colors.white,
          cursorWidth: 5,
          textAlign: TextAlign.center,
          maxLength: 7,
          style: TextStyle(
            fontSize: 75,
            color: Colors.white,
            height: 1.5,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Enter Code"
          ),
        ))
    );
  }
}

