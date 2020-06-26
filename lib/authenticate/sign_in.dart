import 'package:flutter/material.dart';
import 'package:streetracegather/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn(this.toggleView);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = new AuthService();
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
            "Sign In",
            style: TextStyle(color: Colors.grey),
        ),
        actions: [
          FlatButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.grey),
              )
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
        child: Form(
          child: Column(
            children: [
              SizedBox(height: 20,),
              TextFormField(
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20,),
              RaisedButton(
                color: Colors.black87,
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.grey),
                ),
                onPressed: () async {
                  print(email);
                  print(password);
                },
              )
            ],
          )
        ),
        /*
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
        */
      ),
    );
  }
}

