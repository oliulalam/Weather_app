import 'package:flutter/material.dart';
import 'package:weather_app/activity/home.dart';
import 'package:weather_app/activity/loading.dart';
import 'package:flutter/services.dart';


void main(){

  // WidgetsFlutterBinding.ensureInitialized();
  //
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: Colors.white, // Status bar এর ব্যাকগ্রাউন্ড রঙ
  //   statusBarIconBrightness: Brightness.dark, // Icon এর রঙ (light বা dark)
  // ));

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/" : (context) => LoadingState(),
      "/home" : (context) => Home(),
    },
  ));
}


