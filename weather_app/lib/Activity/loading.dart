import 'package:flutter/material.dart';
import 'package:weather_app/worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
   String city = "jalgaon";
  late String temp;
  late String humi;
  late String air_speed;
  late String des;
  late String main;
  late String icon;

  void startApp(String city) async {
    worker instance = worker(location: city);
    await instance.getData();

    temp = instance.temp;
    humi = instance.humidity;
    air_speed = instance.air_speed;
    des = instance.description;
    main = instance.main;
    icon = instance.icon;
    Future.delayed(Duration(seconds: 7), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "temp_value": temp,
        "hum_value": humi,
        "air_speed": air_speed,
        "des_value": des,
        "main": main,
        "icon_value": icon,
        "city_value": city,
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final Map search = ModalRoute.of(context)?.settings.arguments as Map ;
   // if(search?.isNotEmpty ?? false) {
      //city = search['searchText'];
  //  }
    startApp(city);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "images/logo.png",
              height: 240,
              width: 240,
            ),
            SizedBox(
              height: 30,
            ),
            Text("Weather App",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500)),
            Text(
              "Made by Avanish",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 30,
            ),
            SpinKitWave(
              color: Colors.black87,
              size: 50.0,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue[500],
    );
  }
}
