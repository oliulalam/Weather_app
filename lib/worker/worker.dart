import 'package:http/http.dart' as http;
import 'dart:convert';

class Worker {
  late String location;
  late double temp;
  late String feelsLike;
  late String speed;
  late String deg;
  late String country;
  late String sunrise;
  late String sunset;

  Future<void> getData() async {

    var url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=Dhaka&appid=7ab2cdd1d66f834e95acb8363d4930c5&units=metric");

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      location   = data["name"];
      temp       = data["main"]["temp"]-273.15;
      feelsLike  = data["main"]["feels_like"].toString();
      speed      = data["wind"]["speed"].toString();
      deg        = data["wind"]["deg"].toString();
      country    = data["sys"]["country"];
      sunrise    = data["sys"]["sunrise"].toString();
      sunset     = data["sys"]["sunset"].toString();
    } else {
      print("Error: ${response.statusCode}");
    }
  }
}
