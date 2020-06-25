import 'package:flutter/material.dart';
import 'package:streetracegather/authenticate/authenticate.dart';
import 'package:streetracegather/helpers/competitorInfo.dart';
import 'home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final competitorInfo = Provider.of<CompetitorInfo>(context);

    if (competitorInfo == null)
      return Authenticate();
      //Navigator.pushNamed(context, "/authenticate");
    else
      return Home();
      //Navigator.pushNamed(context, "/home");
  }
}

