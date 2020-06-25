import 'package:flutter/material.dart';
import 'package:streetracegather/authenticate/authenticate.dart';
import 'package:streetracegather/helpers/competitorInfo.dart';
import 'package:streetracegather/pages/enter_race.dart';
import 'package:streetracegather/pages/home.dart';
import 'package:streetracegather/pages/loading.dart';
import 'package:streetracegather/pages/start_race.dart';
import 'package:streetracegather/pages/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:streetracegather/services/auth.dart';

void main() => runApp(MaterialApp(
    routes: {
      "/home" : (context) => Home(),
      "/start_race" : (context) => StartRace(),
      "/enter_race" : (context) => EnterRace(),
      "authenticate" : (context) => Authenticate(),
    },
    home: MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CompetitorInfo>.value(
      value: AuthService().user,
        child: Wrapper(),
      //child: MaterialApp(
      //  initialRoute: "/",
      //  routes: {
      //    "/" : (context) => Wrapper(),
      //    "/home" : (context) => Home(),
      //    "start_race" : (context) => StartRace(),
      //    "enter_race" : (context) => EnterRace(),
      //    "authenticate" : (context) => Authenticate(),
      //  },
    );
  }
}

