import 'package:flutter/material.dart';
import 'package:streetracegather/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register(this.toggleView);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
            "Register",
            style: TextStyle(color: Colors.grey),
        ),
        actions: [
          FlatButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text(
                  "Register",
                  style: TextStyle(color: Colors.grey),
              )
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20,),
                TextFormField(
                  validator: (val) => val.trim().isEmpty ? "Enter an email" : null,
                  onChanged: (val) {
                    setState(() => email = val.trim());
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  obscureText: true,
                  validator: (val) => val.trim().length < 6 ? "Password must be at least 6 characters long" : null,
                  onChanged: (val) {
                    setState(() => password = val.trim());
                  },
                ),
                SizedBox(height: 20,),
                RaisedButton(
                  color: Colors.black87,
                  child: Text(
                    "Register",
                    style: TextStyle(color: Colors.grey),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                      if (result == null)
                        setState(() => error = "Please supply a valid email");
                    }
                  },
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red,fontSize: 14),
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
