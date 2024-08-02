import 'package:http/http.dart' as http;
import 'dart:convert';

class worker {
  late String location;
  worker({required this.location}) //this is a parameterise constructors
  {
    location = location;
  }

  late String temp;
  late String humidity;
  late String air_speed;
  late String description;
  late String main;
  late String icon;

  //method=
  Future<void> getData() async {
    try {
      //Api code
      var url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=31c53aaef37f15539b9dbfb6a3e699f2');
      var response = await http.get(url);
      Map data = jsonDecode(response.body);

//Getting temp,humidity
      Map temp_data = data['main'];
      double getTemp = temp_data['temp'] - 273.15;
      String getHumidity = temp_data['humidity'].toString();

//Air Data
      Map wind = data['wind'];
      double getAir_speed = wind['speed'];

//Getting Description
      List weather_data = data['weather'];
      Map weather = weather_data[0];
      String getMain_des = weather['main'];
      String getDesc = weather['description '].toString();

//Assigning Value
      temp = getTemp.toString().substring(0,5);
      humidity = getHumidity;
      air_speed = getAir_speed.toString();
      description = getDesc.toString();
      main = getMain_des;
      icon = weather['icon'].toString();
    } catch (e) {
      print(e);
      temp = "Na";
      humidity = "NA";
      air_speed = "NA";
      description = "NA";
      main = "NA";
      icon = "50n";
    }
  }
}
