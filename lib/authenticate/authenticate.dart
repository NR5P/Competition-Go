import 'package:flutter/material.dart';
import 'package:streetracegather/authenticate/register.dart';
import 'package:streetracegather/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    //return Container(child: SignIn());
    //return Container(child: Register());
    return (showSignIn) ? SignIn(toggleView) : Register(toggleView);
  }
}

