import 'package:http/http.dart' as http;
import 'dart:convert';

class Worker {
  late String location;

  Worker({required this.location}){
    location = this.location;
  }

  late double temp;
  late String feels_like;
  late String speed;
  late String humidity;
  late String country;
  late String icon;
  late String description;


  Future<void> getData() async {
    var url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=7ab2cdd1d66f834e95acb8363d4930c5&units=metric");

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      if (data["cod"].toString() != "200") {
        throw Exception("City not found");
      }

      location   = data["name"];
      temp       = data["main"]["temp"];
      feels_like = data["main"]["feels_like"].toString();
      speed      = data["wind"]["speed"].toString();
      humidity   = data["main"]["humidity"].toString();
      country    = data["sys"]["country"];
      icon       = data["weather"][0]["icon"].toString();
      description= data["weather"][0]["description"];
    } else {
      throw Exception("Error: ${response.statusCode}");
    }
  }

}
