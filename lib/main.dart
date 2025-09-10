import 'package:flutter/material.dart';
import 'package:weather_app/activity/home.dart';
import 'package:weather_app/activity/loading.dart';
import 'package:flutter/services.dart';


void main(){

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/" : (context) => LoadingState(),
      "/home" : (context) => Home(),
    },
  ));
}


