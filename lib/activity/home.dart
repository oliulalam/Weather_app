import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

void timer(){
  
  Future.delayed(Duration(seconds: 9), (){
    print("Alarm is Ringing");
  });
  
  print("You can do another Work");
}


@override
  void initState() {
    super.initState();

    timer();

  }

  @override
  Widget build(BuildContext context) {

    final Map Info = ModalRoute.of(context)!.settings.arguments as Map;

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
    var city = cityName[_random.nextInt(cityName.length)];

    return Scaffold(
      body: SafeArea(
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

              colors: [
                ?Colors.blue[700],
                ?Colors.blue[200],
              ]
            )
          ),

          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                margin: EdgeInsets.symmetric(horizontal: 24, vertical:20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                ),
               // color: Colors.black12,
                child: Row(
                  children: [
                    GestureDetector(onTap: (){},
                    child: Container(
                      child: Icon(Icons.search, color: Colors.blue,),
                       margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                    ),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search $city",
                          border: InputBorder.none,

                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
