import 'package:CovidApp/datasorce.dart';
import 'package:CovidApp/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() {
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'JosefinSans',
      primaryColor: primaryWhite,
    ),
    home: HomePage(),
  ));
}

