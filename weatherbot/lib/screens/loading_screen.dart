import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weatherbot/services/location.dart';
import 'package:weatherbot/services/networking.dart';

const apiKey = '07b2b0174e0f21f92ef5985a232e6c7d';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude;
  double longitude;

  void getLocationData() async {
     Location location = Location();

     await location.getCurrentLocation();
     latitude = location.latitude;
     longitude = location.longitude;

     NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

     var weatherData = await networkHelper.getData();

     double temperature = weatherData['main']['temp'];
     int condition = weatherData['weather'][0]['id'];
     String cityName = weatherData['name'];

     print(temperature);
     print(condition);
     print(cityName);
  }

  @override
  void initState() {

    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //Get the current location
            //getLocation();
            getData();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
