import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();
  @override

  @override
  Widget build(BuildContext context) {
    var city_name = ["Mumbai", "Delhi", "Nashik", "Pune", "Bhopal", "Udaipur"];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];
    final Map info = ModalRoute.of(context)?.settings.arguments as Map;
    String temp = ((info['temp_value']).toString());
    String icon = info['icon_value'];
    String getcity = info['city_value'];
    String hum = info['hum_value'];
    String air = info['air_speed'];
    String main = info['main'];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.black,
        ),
      ),
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Colors.blue,
              Colors.blue.shade500,
              Colors.blue,
              Colors.blue.shade300
            ])),
        child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 3),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/Loading",arguments: {
                      "searController":searchController.text
                    });

                  },

                  child: Container(
                    child: Icon(Icons.search),
                    margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                  ),
                ),
                Expanded(
                    child: TextField(
                   controller:searchController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search City Name $city ...."),
                ))
              ],
            ),
          ),
          Row(
            children: [                           //container1
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.5)),
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Image.network(
                            "https://openweathermap.org/img/wn/$icon@2x.png"),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "$main",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "In $getcity",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                      ],
                    )),
              ),
            ],
          ),
          Row(
            children: [               //container2
              Expanded(
                child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.5)),
                    padding: EdgeInsets.all(26),
                    margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          (Icons.thermostat_rounded),
                          size: 40,
                          color: CupertinoColors.white,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$temp",
                              style: TextStyle(fontSize: 90),
                            ),
                            Text(
                              "°C",
                              style: TextStyle(fontSize: 45),
                            )
                          ],
                        )
                      ],
                    )),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                    //container3
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.5)),
                    padding: EdgeInsets.all(25),
                    height: 175,
                    margin: EdgeInsets.fromLTRB(25, 0, 10, 0),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.air_outlined,
                                color: CupertinoColors.white,
                                size: 40,
                              ),
                            ]),
                        Text("$air",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w700)),
                        Text("Km/Hr",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700))
                      ],
                    )),
              ),
              Expanded(
                child: Container(
                    //container4
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.5)),
                    padding: EdgeInsets.all(25),
                    height: 175,
                    margin: EdgeInsets.fromLTRB(10, 0, 25, 0),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.water_drop_outlined,
                                color: CupertinoColors.white,
                                size: 40,
                              ),
                            ]),
                        Text("$hum",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w700)),
                        Text("Percent",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700))
                      ],
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 125,
          ),
          Text("Made By Avanish",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        ]),
      )),
    );
  }
}
