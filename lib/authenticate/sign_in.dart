import 'package:flutter/material.dart';
import 'package:streetracegather/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = new AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("Sign In"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
        child: RaisedButton(
          child: Text("sign in anonymously"),
          onPressed: () async {
            dynamic result = await _auth.signInAnonymously();
            if (result == null) {
              print("error signing in");
            } else {
              print("signed in successfully");
              print(result);
            }
          },
        ),
      ),
    );
  }
}

