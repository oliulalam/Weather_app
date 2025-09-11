import 'dart:math';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  TextEditingController searchController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    final Map Info = ModalRoute.of(context)!.settings.arguments as Map;
    var city = Info["city"];
    var tempp = Info["temp"].toString().substring(0, 2);
    var speedd = Info["speed"];
    var humidity = Info["humidity"];
    var feels_like = Info["feels_like"].toString().substring(0, 2);
    var icon = Info["icon"];
    var description = Info["description"];

    List<String> cityName = [
      "Dhaka",
      "Faridpur",
      "Gazipur",
      "Gopalganj",
      "Kishoreganj",
      "Madaripur",
      "Manikganj",
      "Munshiganj",
      "Narayanganj",
      "Narsingdi",
      "Rajbari",
      "Shariatpur",
      "Tangail",
      "Bogra",
      "Joypurhat",
      "Naogaon",
      "Natore",
      "Chapai Nawabganj",
      "Pabna",
      "Rajshahi",
      "Sirajganj",
      "Dinajpur",
      "Gaibandha",
      "Kurigram",
      "Lalmonirhat",
      "Nilphamari",
      "Panchagarh",
      "Rangpur",
      "Thakurgaon",
      "Barguna",
      "Barisal",
      "Bhola",
      "Jhalokati",
      "Patuakhali",
      "Pirojpur",
      "Bandarban",
      "Brahmanbaria",
      "Chandpur",
      "Chattogram",
      "Cumilla",
      "Cox’s Bazar",
      "Feni",
      "Khagrachhari",
      "Lakshmipur",
      "Noakhali",
      "Rangamati",
      "Habiganj",
      "Moulvibazar",
      "Sunamganj",
      "Sylhet",
      "Bagerhat",
      "Chuadanga",
      "Jashore",
      "Jhenaidah",
      "Khulna",
      "Kushtia",
      "Magura",
      "Meherpur",
      "Narail",
      "Satkhira",
      "Mymensingh",
      "Jamalpur",
      "Netrokona",
      "Sherpur",
    ];

    var _random = new Random();
    var cityy = cityName[_random.nextInt(cityName.length)];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(backgroundColor: Colors.blue[700]),
      ),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
        
                // stops: [
                //   0.10,
                //   0.3,
                //   0.7
                // ],
                colors: [?Colors.blue[700], ?Colors.blue[200]],
              ),
            ),
        
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  // color: Colors.black12,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          print(searchController.text);
                          Navigator.pushNamed(context, "/loading", arguments:{
                          "searchText": searchController.text }
                          );
                        },
                        child: Container(
                          child: Icon(Icons.search, color: Colors.blue),
                          margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: "Search $cityy",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        //padding: EdgeInsets.all(26),
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        padding: EdgeInsets.only(left: 25),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(
                              "https://openweathermap.org/img/wn/$icon@2x.png",
                              height: 70,
                              width: 70,
                            ),
                            SizedBox(width: 40),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "$description",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
        
                                Text(
                                  "In $city",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        
                SizedBox(height: 15),
        
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        padding: EdgeInsets.all(26),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(WeatherIcons.thermometer),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("$tempp", style: TextStyle(fontSize: 80)),
                                SizedBox(width: 10),
                                Text("C", style: TextStyle(fontSize: 35)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        
                SizedBox(height: 15),
        
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 200,
        
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          padding: EdgeInsets.all(26),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [Icon(WeatherIcons.sunrise)],
                              ),
        
                              SizedBox(height: 20),
        
                              Text(
                                "$speedd",
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text("km/hr"),
                            ],
                          ),
                        ),
                      ),
        
                      Expanded(
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.white.withOpacity(0.5),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          padding: EdgeInsets.all(26),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [Icon(WeatherIcons.humidity)],
                              ),
        
                              SizedBox(height: 20),
        
                              Text(
                                "$humidity",
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text("Percent"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        
                SizedBox(height: 15),
        
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 118,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        //padding: EdgeInsets.all(26),
                        margin: EdgeInsets.symmetric(horizontal: 70),
                        padding: EdgeInsets.all(26),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(WeatherIcons.fire, size: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "$feels_like",
                                  style: TextStyle(fontSize: 35),
                                ),
                                SizedBox(width: 10),
                                Text("C", style: TextStyle(fontSize: 25)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        
                SizedBox(height: 20),
                Text("Created By Oliul", style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Text(
                  "Data Collected Form OpenWeather.org",
                  style: TextStyle(fontSize: 15),
                ),

                SizedBox(height: 65,)

              ], // Main column Child
            ), // Main column
          ),
        ),
      ),
    );
  }
}
