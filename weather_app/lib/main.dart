import 'package:flutter/material.dart';
import 'package:weather_app/Activity/Home.dart';
import 'package:weather_app/Activity/loading.dart';


void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes:{
      "/" : (context)  => Loading(),
      "/home" : (context) => Home(),
      "/Loading":(context) => Loading(),
    },
  ));
}
