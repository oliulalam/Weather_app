import 'package:flutter/material.dart';
import 'package:weather_app/worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingState extends StatefulWidget {
  const LoadingState({super.key});

  @override
  State<LoadingState> createState() => _LoadingStateState();
}

class _LoadingStateState extends State<LoadingState> {
  String Loading = "Loading..";

  late String city;
  late String  temp;
  late String feels_like;
  late String speed;
  late String humidity;
  late String country;
  late String icon;
  late String description;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // argument নেওয়া
    final Map? search = ModalRoute.of(context)!.settings.arguments as Map?;
    city = search != null && search["searchText"] != ""
        ? search["searchText"]
        : "Dhaka";

    // ডাটা লোড করা
    ShowData();
  }

  ShowData() async {
    try {
      Worker instance = Worker(location: city);
      await instance.getData();

      temp = instance.temp.toString();
      feels_like = instance.feels_like;
      speed = instance.speed;
      humidity = instance.humidity;
      country = instance.country;
      icon = instance.icon;
      description = instance.description;

      Navigator.pushReplacementNamed(
        context,
        '/home',
        arguments: {
          "city": city,
          "temp": temp,
          "feels_like": feels_like,
          "speed": speed,
          "humidity": humidity,
          "country": country,
          "icon": icon,
          "description": description,
        },
      );
    } catch (e) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("City not found. Try again!", style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
        ),
      );

      Navigator.pop(context); // আগের স্ক্রিনে ফেরা
    }
  }


  @override
  void initState() {
    ShowData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final Map? search = ModalRoute.of(context)!.settings.arguments as Map?;

    if (search != null && search["searchText"] != null && search["searchText"].toString().isNotEmpty) {
      city = search["searchText"];
    } else {
      city = "Dhaka"; // default city
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/weather.png', height: 180, width: 180),
            SizedBox(height: 30),
            Text("Weather App", style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold)),
            SizedBox(height: 25),
            Text("Created by Oliul", style: TextStyle(fontSize: 25, color: Colors.white)),
            SizedBox(height: 30),
            SpinKitWanderingCubes(color: Colors.white, size: 60.0),

          ],
        ),
      ),

      backgroundColor: Colors.blue[300],

    );
  }
}
