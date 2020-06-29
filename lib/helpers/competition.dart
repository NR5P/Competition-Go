import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class Competition {
  String name;
  DateTime startTime;
  String startLocation;
  String endLocation;

  Competition(this.name, this.startTime, this.startLocation, this.endLocation);

  String showCountDownTime() {
    DateTime now = new DateTime.now();
    int timeLeft = startTime.difference(now).inSeconds;
    int hours = timeLeft ~/ 3600;
    int remainder = timeLeft - hours * 3600;
    int minutes = remainder ~/ 60;
    remainder = remainder - minutes * 60;
    int seconds = remainder;
    String displayTime = "";
    displayTime += hours < 10 ? "0" + hours.toString() + ":" : hours.toString() + ":";
    displayTime += minutes < 10 ? "0" + minutes.toString() + ":" : minutes.toString() + ":";
    displayTime += seconds < 10 ? "0" + seconds.toString() : seconds.toString();
    return displayTime;
  }

  int getSecondsLeft() {
    DateTime now = new DateTime.now();
    int timeLeft = startTime.difference(now).inSeconds;
    return timeLeft;
  }
}