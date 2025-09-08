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

  late String location;
  late String  temp;
  late String feelsLike;
  late String speed;
  late String deg;
  late String country;
  late String sunrise;
  late String sunset;

  ShowData() async {
    Worker instance = Worker();
    await instance.getData();
    location = instance.location;
    temp = instance.temp.toString();
    feelsLike = instance.feelsLike;
    speed = instance.speed;
    deg = instance.deg;
    country = instance.country;
    sunrise = instance.sunrise;
    sunset = instance.sunset;

    Navigator.pushReplacementNamed(
      context,
      '/home',
      arguments: {
        "location": location,
        "temp": temp,
        "feelsLike": feelsLike,
        "speed": speed,
        "deg": deg,
        "country": country,
        "sunrise": sunrise,
        "sunset": sunset,
      },
    );
  }

  @override
  void initState() {
    ShowData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
